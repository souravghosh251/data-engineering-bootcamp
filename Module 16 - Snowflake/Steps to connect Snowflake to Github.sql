CREATE OR REPLACE API INTEGRATION dataxbootcamprepo
        API_PROVIDER = git_https_api
        API_ALLOWED_PREFIXES = (
                'https://github.com/souravghosh251'
        )
        ENABLED = TRUE
        ALLOWED_AUTHENTICATION_SECRETS = ALL
        COMMENT = 'API Integration for Data Engineering Bootcamp Github repo'

        --- SECOND STEP

        ALTER GIT REPOSITORY datax_bootcamp_repo
        SET AUTHENTICATION(
        TYPE:'GITHUB',
        TOKEN:'<PASTE TOKEN HERE>'
        );