*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BASE_URL}     https://awesomeqa.com
${UPLOAD_API}   /index.php?route=tool/upload
${FILE_PATH}    ${CURDIR}/../Resourses/test_upload.png
${PRODUCT_URL}  https://awesomeqa.com/ui/index.php?route=product/product&path=25_28&product_id=42

*** Keywords ***
Upload File Via API
    Create Session    upload    ${BASE_URL}

    ${files}=    Create Dictionary
    ...    file=@${FILE_PATH}

    ${resp}=    Post On Session
    ...    upload
    ...    ${UPLOAD_API}
    ...    files=${files}

    Should Be Equal As Integers    ${resp.status_code}    200

    ${json}=    Evaluate    ${resp.json()}    json
    Log    Upload response: ${json}

    RETURN    ${json}

