AWS_SECRET_KEY_ID='abc'
AWS_SECRET_KEY   ='123'
AWS.config({:access_key_id => AWS_SECRET_KEY_ID, :secret_access_key => AWS_SECRET_KEY})
AWS::Record.domain_prefix = "simpledevise-#{Rails.env}-"