<%@ page import="java.sql.SQLException" %>
<head>
    <!-- Barre de titre -->
    <title>Hub UdeS</title>
    <link rel="icon" href="img/logo1.png" type="image/png">
</head>

<body>

<div id = "root" ></div>
<script src = 'https://unpkg.com/react@16.12.0/umd/react.development.js'></script>
<script src = 'https://unpkg.com/react-dom@16.12.0/umd/react-dom.development.js'></script>
<script src="https://unpkg.com/@babel/standalone@7.8.3/babel.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>


<!-- style css !-->

<style>

    .div-principale {
        font-family: "Franklin Gothic Book", serif;
        color: #3d3d3d;
        font-size: 105%;
    }

    p {
        font-family: "Franklin Gothic Book", serif;
        color: #3d3d3d;
        font-size: 105%;
    }

    .p-banderole {
        color: #e8e8e8;
        width: 0%;
        z-index: 1;
    }

    button {
        font-family: "Franklin Gothic Book", serif;
        color: #3d3d3d;
        font-size: 105%;
        border: 1px solid darkgray;
        background-color: transparent;
        border-radius: 10px;
    }

    button:hover {
        border: 1px solid darkgray;
        background-color: #d8d8d8;
    }

    .boutton-notification {
        border-radius: 10px;
        text-align: center;
        width:100%;
        height: 100%;
        background-color: transparent;
        border: 1px solid darkgray;
    }

    tbody {
        width: 100%;
    }

    table {
        width: 100%;
        font-family: "Franklin Gothic Book", serif;
        color: #3d3d3d;
        font-size: 105%;
    }

    td {
        border-radius: 10px;
        height: 8rem;
        width: 99%;
        text-align: center;
    }

    td:hover {
        background-color: #d8d8d8;
    }

    tr {
        width: 100%;
    }

    td:empty {
        display: none;
        height: 0%
    }

    img {
        margin: 11%;
        min-height: 11%;
        border-radius: 200%;
        height: 0%;
        z-index: -1;
        position: relative;
        box-shadow: -5px 5px 10px rgba(0, 0, 0, 0.29);
    }

    .logo-udes {
        margin-top: 0px;
        margin-left: 0px;
        max-width: 90px;
        min-height: 90px;
        max-height: 90px;
        border-radius: 10px;
        float: none;
        z-index: 1;
        box-shadow: none;
    }

    .logo-site {
        margin-top: 0px;
        margin-left: 0px;
        height: 90px;
        max-width: 500px;
        border-radius: 0px;
        width: auto;
        float: none;
        z-index: 1;
        box-shadow: none;
    }

    .logo-profile {
        margin-top: 10px;
        margin-left: 0px;
        margin-right: 5%;
        height: 70px;
        max-width: 70px;
        border-radius: 0px;
        width: auto;
        float: none;
        z-index: 1;
        box-shadow: none;
    }

    .logo-colone {
        float: top;
        z-index: -1;
    }

    .pop-up-notification-colonne {
        text-align: center;
        margin-left: 60%;
        float: left;
        width: 0%;
        height: 0%;
        z-index: 1;
    }

    .pop-up-notification {
        display: grid;
        place-items: center;

        color: #e8e8e8;
        border-radius: 30px;
        background: #df1414;
        box-shadow: -5px 5px 10px rgba(0, 0, 0, 0.66);

        min-width: 30px;
        min-height: 30px;
        max-width: 30px;
        max-height: 30px;

        z-index: 1;
    }

    .banderole {
        background-color: #00a556;
        max-height: 90px;
        min-height: 90px;
        margin-top: 0.5%;
        margin-right: 0.5%;
        margin-left: 0.5%;
        border-radius: 10px;
        box-shadow: -5px 5px 10px rgba(0, 0, 0, 0.29);
    }

    a {
        text-decoration: none;
        color: #3d3d3d;
    }

    a:link {
        text-decoration: none;
        color: #3d3d3d;
    }

    a:visited {
        text-decoration: none;
        color: #3d3d3d;
    }

    a:hover {
        text-decoration: none;
        color: #3d3d3d;
    }

    a:active {
        text-decoration: none;
        color: #3d3d3d;
    }

    .col-container {
        height: 100%
    }

    .col-1 {
        background-color: #e8e8e8;
        float: left;
        width: 14%;
        height: 87%;
        margin: 0.5%;
        border-radius: 10px;
    }
    .col-2 {
        text-align: center;
        float: left;
        width: 50%;
        height: 87%;
        margin-top: 0.5%;
        margin-bottom: 0.5%;
        border-radius: 10px;
    }

    .col-3 {
        background-color: #e8e8e8;
        width: 34%;
        float: left;
        height: 87%;
        margin: 0.5%;
        border-radius: 10px;
        overflow-y: auto;
    }


    .container-notification{
        text-align: center;
    }

    .center-grid {
        float: left;
        width: 20%;
    }

    .cadre-notif {
        border: 1px solid darkgray;
        border-radius: 10px;
        display: flex;
        height: 20%;
        width: 100%;
    }

    @media only screen and (max-width: 760px) {
        [class*="col-"] {
            border-bottom-style: solid;
            border-bottom-width: medium;
            width: 100%;
        }
    }

</style>

<script type = "text/babel">

    const rootElement = document.getElementById('root')

    // creation des images

    const imageUdeSElement =
        <img className = "logo-udes" src="img/udes.png" alt="logo-universite">
        </img>

    const imageSiteElement =
        <img className = "logo-site" src="img/logo2.png" alt="logo-universite">
        </img>

    const nomutilisateurElement =
        <a data-target="user-session" id="user-session-dropdown" className="dropdown-trigger">
            <p className="p-banderole">
                Utilisateur
            </p>
        </a>

    const imageProfileElement =
        <img className = "logo-profile" src="img/profile.png" alt="logo-universite">
        </img>

    // creation de la banderole

    const banderoleElement =
        <div className = "banderole" style = {{height: '90px'}}>
            <div className="col-2" style = {{margin: '0px', height: '90px', width: '33%', textAlign: 'left'}}>
                {imageUdeSElement}
            </div>
            <div className="col-2" style = {{margin: '0px', height: '90px', width: '33%', textAlign: 'center'}}>
                {imageSiteElement}
            </div>
            <div className="col-2" style = {{margin: '0px', height: '90px', width: '28%', textAlign: 'right'}}>
                {imageProfileElement}
            </div>
            <div className="col-2" style = {{margin: '0px', height: '90px', width: '5%', textAlign: 'left'}}>
                {nomutilisateurElement}
            </div>
        </div>

        // creation des etats

        const stateBoutonRandom = {eventCount: 0, username: 'boutonRandom'}

        const stateMoodle = {compteNotifications: 0}
        const stateHorarius = {compteNotifications: 0}
        const stateTrivio = {compteNotifications: 0}
        const stateSiteSession = {compteNotifications: 0}
        const stateOutlook = {compteNotifications: 0}
        const statePortail = {compteNotifications: 0}
        const stateTeams = {compteNotifications: 0}

        const arrayNotification = [
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },{
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },{
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
            {
                expediteur: 'expediteur',
                titre: 'titre',
                date: 'date',
                description: 'description',
                link: 'link'
            },
        ]

        const stateIndexArrayNotification = {nombreNotification: 0}

        // fonction App()

        function App() {

            // creation des pop ups

            const popUpMoodleElement =
                <p className="pop-up-notification">
                    {stateMoodle.compteNotifications}
                </p>

            const popUpHorariusElement =
                <p className="pop-up-notification">
                    {stateHorarius.compteNotifications}
                </p>

            const popUpSiteSessionElement =
                <p className="pop-up-notification">
                    {stateSiteSession.compteNotifications}
                </p>

            const popUPortailElement =
                <p className="pop-up-notification">
                    {statePortail.compteNotifications}
                </p>

            const popUpTrivioElement =
                <p className="pop-up-notification">
                    {stateTrivio.compteNotifications}
                </p>

            const popUpOutlookElement =
                <p className="pop-up-notification">
                    {stateOutlook.compteNotifications}
                </p>

            const popUpTeamsElement =
                <p className="pop-up-notification">
                    {stateTeams.compteNotifications}
                </p>

            // creation des icones centrales

            let moodleElement

            if (stateMoodle.compteNotifications > 0) {
                moodleElement =
                    <a href="https://www.usherbrooke.ca/moodle2-cours/" target="_blank" onClick={() => VisiteSite(stateMoodle, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpMoodleElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/moodle.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                moodle
                            </p>
                        </section>
                    </a>
            } else {
                moodleElement =
                    <a href="https://www.usherbrooke.ca/moodle2-cours/" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/moodle.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                moodle
                            </p>
                        </section>
                    </a>
            }

            let horariusElement

            if (stateHorarius.compteNotifications > 0) {
                horariusElement =
                    <a href="https://cas.usherbrooke.ca/login?service=https%3A%2F%2Fwww.gel.usherbrooke.ca%2Fhorarius%2F" target="_blank" onClick={() => VisiteSite(stateHorarius, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpHorariusElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/horarius.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                horarius
                            </p>
                        </section>
                    </a>
            } else {
                horariusElement =
                    <a href="https://cas.usherbrooke.ca/login?service=https%3A%2F%2Fwww.gel.usherbrooke.ca%2Fhorarius%2F" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/horarius.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                horarius
                            </p>
                        </section>
                    </a>
            }

            let siteSessionElement

            if (stateSiteSession.compteNotifications > 0) {
                siteSessionElement =
                    <a href="https://cas.usherbrooke.ca/login?service=https%3a%2f%2fwww.gel.usherbrooke.ca%2fs3i%2fe21%2f" target="_blank" onClick={() => VisiteSite(stateSiteSession, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpSiteSessionElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/siteSession.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                site session
                            </p>

                        </section>
                    </a>
            } else {
                siteSessionElement =
                    <a href="https://cas.usherbrooke.ca/login?service=https%3a%2f%2fwww.gel.usherbrooke.ca%2fs3i%2fe21%2f" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/siteSession.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                site session
                            </p>

                        </section>
                    </a>
            }

            let portailElement

            if (statePortail.compteNotifications > 0) {
                portailElement =
                    <a href="https://authentification.usherbrooke.ca/adfs/ls/" target="_blank" onClick={() => VisiteSite(statePortail, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style={{width: '0%', height: '0%'}}>
                                {popUPortailElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/portail.jpg" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                portail
                            </p>
                        </section>
                    </a>
            } else {
                portailElement =
                    <a href="https://authentification.usherbrooke.ca/adfs/ls/" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/portail.jpg" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                portail
                            </p>
                        </section>
                    </a>
            }

            let trivioElement

            if (stateTrivio.compteNotifications > 0) {
                trivioElement =
                    <a href="  https://trivio.usherbrooke.ca/home.htm" target="_blank" onClick={() => VisiteSite(stateTrivio, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpTrivioElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/trivio.jpg" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                trivio
                            </p>

                        </section>
                    </a>
            } else {
                trivioElement =
                    <a href="https://trivio.usherbrooke.ca/home.htm" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/trivio.jpg" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                trivio
                            </p>

                        </section>
                    </a>
            }

            let outlookElement

            if (stateOutlook.compteNotifications > 0) {
                outlookElement =
                    <a href="https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1622688870&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3dcbbeb4d7-df84-45ac-6811-15a679190571&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015" target="_blank" onClick={() => VisiteSite(stateOutlook, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpOutlookElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/outlook.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                outlook
                            </p>
                        </section>
                    </a>
            } else {
                outlookElement =
                    <a href="https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1622688870&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3dcbbeb4d7-df84-45ac-6811-15a679190571&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/outlook.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                outlook
                            </p>
                        </section>
                    </a>
            }

            let teamsElement

            if (stateTeams.compteNotifications > 0) {
                teamsElement =
                    <a href="https://teams.microsoft.com/_?culture=en-ca&country=CA&lm=deeplink&lmsrc=NeutralHomePageWeb&cmpid=WebSignIn" target="_blank" onClick={() => VisiteSite(stateTeams, {compteNotifications: 0})}>
                        <section className="center-grid">

                            <div className="pop-up-notification-colonne" style = {{width: '0%', height: '0%'}}>
                                {popUpTeamsElement}
                            </div>

                            <div className="logo-colone">
                                <img src="img/microsoftTeams.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                teams
                            </p>
                        </section>
                    </a>
            } else {
                teamsElement =
                    <a href="https://teams.microsoft.com/_?culture=en-ca&country=CA&lm=deeplink&lmsrc=NeutralHomePageWeb&cmpid=WebSignIn" target="_blank">
                        <section className="center-grid">

                            <div className="logo-colone">
                                <img src="img/microsoftTeams.png" alt="logo" style = {{marginBottom: '0px'}}/>
                            </div>

                            <p>
                                teams
                            </p>
                        </section>
                    </a>
            }

            // creation des colonnes

            const colGaucheElement =
                <div className="col-1">
                    <p>
                        outlook a {stateOutlook.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Outlook', '2021-06-28', 'nouveau courriel', 'courriel de Domingo sur la validation', 'https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1622688870&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3dcbbeb4d7-df84-45ac-6811-15a679190571&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015')}>
                            cree notification outlook
                        </button>
                    </p>
                    <p>
                        portail a {statePortail.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Portail', '2021-06-28', 'nouveau bulletin', 'bulletin de la session Automne 2021 sortie', 'https://authentification.usherbrooke.ca/adfs/ls/')}>
                            cree notification portail
                        </button>
                    </p>
                    <p>
                        trivio a {stateTrivio.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Trivio', '2021-06-28', 'nouvelle entrevue', 'entrevue a 15h le 2021-06-28 pour la companie xd', 'https://trivio.usherbrooke.ca/home.htm')}>
                            cree notification trivio
                        </button>
                    </p>
                    <p>
                        horarius a {stateHorarius.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Horarius', '2021-06-28', 'nouveau cours', 'cours a 15h le 2021-06-28 pour le cours GIF330', 'https://cas.usherbrooke.ca/login?service=https%3A%2F%2Fwww.gel.usherbrooke.ca%2Fhorarius%2F')}>
                            cree notification horarius
                        </button>
                    </p>
                    <p>
                        stie session a {stateSiteSession.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Site Session', '2021-06-28', 'nouveau document', 'guide etudiant sortit pour APP 3', 'https://cas.usherbrooke.ca/login?service=https%3a%2f%2fwww.gel.usherbrooke.ca%2fs3i%2fe21%2f')}>
                            cree notification site session
                        </button>
                    </p>
                    <p>
                        moodle a {stateMoodle.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => ReceptionNotification('Moodle', '2021-06-28', 'nouvelle evaluation', 'nouvelle evaluation disponible pour le cours GIF330', 'https://www.usherbrooke.ca/moodle2-cours/')}>
                            cree notification moodle
                        </button>
                    </p>
                    <p>
                        teams a {stateTeams.compteNotifications} nouvelle(s) notification(s)
                    </p>
                    <p>
                        <button onClick={() => TestFunction()}>
                            cree notification teams
                        </button>
                    </p>
                </div>

            const colCentralElement =
                <section className="col-2">
                    {trivioElement}
                    {portailElement}
                    {siteSessionElement}
                    {horariusElement}
                    {moodleElement}
                    {outlookElement}
                    {teamsElement}
                    <div>
                        <iframe src="https://www.gel.usherbrooke.ca/horarius/" height="60.5%" width="95%" title="horarius" style = {{borderRadius: '10px', border: '1px solid darkgray'}}/>
                    </div>
                </section>

            const tableDeNotification =
                <table>
                    <tbody>
                        <tr>
                            <td id = 'td-0'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-1'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-2'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-3'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-4'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-5'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-6'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-7'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-8'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-9'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-10'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-11'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-12'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-13'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-14'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-15'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-16'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-17'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-18'>
                            </td>
                        </tr>
                        <tr>
                            <td id = 'td-19'>
                            </td>
                        </tr>
                    </tbody>
                </table>

            const colDroiteElement =
                <div className="col-3" id='scrollbarnotid'>
                    {tableDeNotification}
                </div>


            // assemblage en fragment

            const fragmentElement =
                <React.Fragment>
                    {banderoleElement}
                    <div>
                        {colGaucheElement}
                        {colCentralElement}
                        {colDroiteElement}
                    </div>
                </React.Fragment>

            return (
                <div className="div-principale">
                    {fragmentElement}
                </div>
            )
        }

        // creation de la fonction qui permet de changer l'etat des elements a updater

        function ReceptionNotification(expediteur, date, titre, description, link) {
            CreeNotification(expediteur, titre, date, description, link)
            if (expediteur === "Horarius") {
                Object.assign(stateHorarius, {compteNotifications: stateHorarius.compteNotifications + 1})
            } else if (expediteur === "Site Session") {
                Object.assign(stateSiteSession, {compteNotifications: stateSiteSession.compteNotifications + 1})
            } else if (expediteur === "Trivio") {
                Object.assign(stateTrivio, {compteNotifications: stateTrivio.compteNotifications + 1})
            } else if (expediteur === "Moodle") {
                Object.assign(stateMoodle, {compteNotifications: stateMoodle.compteNotifications + 1})
            } else if (expediteur === "Portail") {
                Object.assign(statePortail, {compteNotifications: statePortail.compteNotifications + 1})
            } else if (expediteur === "Outlook") {
                Object.assign(stateOutlook, {compteNotifications: stateOutlook.compteNotifications + 1})
            } else if (expediteur === "Teams") {
                Object.assign(stateTeams, {compteNotifications: stateTeams.compteNotifications + 1})
            }
            Object.assign(stateIndexArrayNotification, {nombreNotification: (stateIndexArrayNotification.nombreNotification + 1) % 19})
            renderApp()
        }

        function VisiteSite(state, newState) {
            Object.assign(state, newState)
            renderApp()
        }

        // creation des fonction pr remplir une notification et pour afficher le bon nombre de notification

        function CreeNotification(expediteur, titre, date, description, link) {
            for (i = stateIndexArrayNotification.nombreNotification; i > 0; i--) {
                arrayNotification[i].expediteur = arrayNotification[i-1].expediteur
                arrayNotification[i].titre = arrayNotification[i-1].titre
                arrayNotification[i].date = arrayNotification[i-1].date
                arrayNotification[i].description = arrayNotification[i-1].description
                arrayNotification[i].link = arrayNotification[i-1].link
            }
            arrayNotification[0].expediteur = expediteur
            arrayNotification[0].titre = titre
            arrayNotification[0].date = date
            arrayNotification[0].description = description
            arrayNotification[0].link = link
        }

        let idRow;
        let i;
        i = 0;

        const interval = setInterval(function(){
            <jsp:useBean id="apiLink" scope="request" class="main.PortailAPILink"/>
            ReceptionNotification("<%=apiLink.getExpediteur()%>", "<%=apiLink.getDate()%>","<%=apiLink.getTitre()%>","<%=apiLink.getDescription()%>","<%=apiLink.getLink()%>");
        },5000);

        function AfficherNotification() {
            for (i = 0; i < stateIndexArrayNotification.nombreNotification; i++) {
                idRow = 'td-'+i
                document.getElementById(idRow).innerHTML = '<button class="boutton-notification" onclick=window.open("' + arrayNotification[i].link + '")>' + arrayNotification[i].expediteur + ': ' + arrayNotification[i].titre + '<br>' + '<br>' + arrayNotification[i].description + '<br>' + '<br>' + arrayNotification[i].date + '</button>'
            }
        }

        function ChangerSite() {
            return (
                <meta http-equiv="refresh" content="7; url='https://www.w3docs.com'" />
            )
        }

        // creation de la fonction qui permet de re render les elements updater

        function renderApp() {
            ReactDOM.render(<App/>,rootElement)
            AfficherNotification();
            OpenPage()
        }

        function OpenPage() {
            $.ajax({
                url: "https://monportail.usherbrooke.ca/api/mail/messages",
                type: 'GET',
                dataType: 'jsonp',
                contentType: 'text/plain',
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'X-Content-Type-Options': 'application/json'
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader ("Authorization", "Basic " + btoa(""));
                    xhr.setRequestHeader("Access-Control-Allow-Headers", "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
                },
                success: function (data) {
                    console.log(data.organizations[0].name);
                    let organisation = data.organizations[0].name;
                    $("#company").text(organisation);
                }
            });
        }

        renderApp()

    </script>

</body>