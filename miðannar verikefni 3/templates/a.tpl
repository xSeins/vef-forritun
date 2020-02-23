<!DOCTYPE html>
<html>
<head>
    <title>Bensínstöðvar</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/static/bensin.css">
</head>
<body>
    <h1>Söluaðilar eldsneytis á Íslandi</h1>
    <div class="mynd">
        <img src="/static/{{myndir[0]['mynd']}}" alt="Mynd 1"/>
        <img src="/static/{{myndir[1]['mynd']}}" alt="Mynd 2"/>
        <img src="/static/{{myndir[2]['mynd']}}" alt="Mynd 3"/>
        <img src="/static/{{myndir[3]['mynd']}}" alt="Mynd 4"/>
        <img src="/static/{{myndir[4]['mynd']}}" alt="Mynd 5"/>
        <img src="/static/{{myndir[5]['mynd']}}" alt="Mynd 6"/>
        <img src="/static/{{myndir[6]['mynd']}}" alt="Mynd 7"/>
        <img src="/static/{{myndir[7]['mynd']}}" alt="Mynd 8"/>
    </div>
    <table border="2" class="tafla">
        <tr>
            <th class="texti">Nafn</th>
        </tr>

        % for nafn in data["results"]:
            % if nafn["key"][-3:] == "000":
                <tr>
                    <td class="texti"><a href="/company/{{nafn['company']}}">{{nafn["company"]}}</a></td>
                </tr>
            % end
        % end
    </table>
    % import math
    % odyrastabensin = []
    % odyrastadiesel = []
    % for nafn in data["results"]:
        % odyrastabensin.append(nafn["bensin95"])
        % if nafn["bensin95_discount"] is not None:
            % odyrastabensin.append(nafn["bensin95_discount"])
        % end
        % odyrastadiesel.append(nafn["diesel"])
        % if nafn["diesel_discount"] is not None:
            % odyrastadiesel.append(nafn["diesel_discount"])
        % end
    % end
    % bensin = min(odyrastabensin)
    % diesel = min(odyrastadiesel)
    % odyrastabensinfyritaeki = "Ekki Til"
    % odyrastibensinstadur = "Ekki Til"
    % odyrastadieselfyritaeki = "Ekki Til"
    % odyrastidieselstadur = "Ekki Til"
    % for nafn in data["results"]:
        % if nafn["bensin95"] == bensin:
            % odyrastabensinfyritaeki = nafn["company"]
            % odyrastibensinstadur = nafn["name"]
        % end
        % if nafn["bensin95_discount"] == bensin:
            % odyrastabensinfyritaeki = nafn["company"]
            % odyrastibensinstadur = nafn["name"]
        % end
        % if nafn["diesel"] == diesel:
            % odyrastadieselfyritaeki = nafn["company"]
            % odyrastidieselstadur = nafn["name"]
        % end
        % if nafn["diesel_discount"] == diesel:
            % odyrastadieselfyritaeki = nafn["company"]
            % odyrastidieselstadur = nafn["name"]
        % end
    % end
    <p>Ódýrasta bensín: {{bensin}} kr. hjá {{odyrastabensinfyritaeki}}, {{odyrastibensinstadur}}</p>
    <p>Ódýrasta díesel: {{diesel}} kr. hjá {{odyrastadieselfyritaeki}}, {{odyrastidieselstadur}}</p>
    % listinn = data["timestampPriceCheck"]
    % list(listinn)
    <p>Síðast uppfært : {{listinn[8:10]}}.{{listinn[5:7]}}.{{listinn[:4]}} Kl. {{listinn[11:16]}}</p>
</body>
</html>