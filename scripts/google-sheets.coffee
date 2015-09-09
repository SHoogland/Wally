# Description:
#   Manipulating google spreadsheets.
#
# Commands:
#   hubot addrow - add something to a spreadsheet

module.exports = (robot) ->
  robot.respond /addrow (.*)/i, (res) ->
    GoogleSpreadsheet = require('google-spreadsheet')
    # spreadsheet key is the long id in the sheets URL
    my_sheet = new GoogleSpreadsheet('14oOiCYWvkfvLR2i3w8jwIlNNewLC2Ilr0WojXk4g2QM')
    creds =
      private_key_id: '5551499d239aaea87fd0dc3b933afde2a0da0cba'
      private_key: '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC60TkpdWsvrL3E\ncaAC6pdr6ylJ+KG5P9AODZMm4tp8ofztxLbRBmjGHGaryOcvOyrskO9BzxYSIfp/\nMowA/G14NZwUGuU77TWnHpVw4Rop9FKuAOtRkqXMVjJknPZ1r/LvGGywAfCynD8R\nxk8w76YK1dgyx32iGapMn07dkBhGmiwt8sPZ0rpoaPPSwyP1x3hZe085H3hUKUbj\n6tnMO5yvMfIxJBgmhIeOehmuujHDOwUXYCGFEob0VhzD9Dd6G7dC5AWnarQSqdMy\nBxKpcdsR/3s1lyYVL3Uy4czTtGS+FbmfjoTo2Q4MdQyRsjdh3TZYUspAxnXxxADe\nfdtn7cVBAgMBAAECggEAEcauxb8if9rUA8k8DIr99Yre1ucNnG7yASRRiDW1zH4t\nbwJ00tblSVSSgG4RcXET2IbB/WUTGI6bI1dP8xgR4opXW6JjhZxAqrJCTgddUfip\nlV0JBy4JELRy/xfga7peR1nvnZ/Ro20yoyJXjrR+/DD07YAF+FKw3bGa84IujSkc\nw9ug6ZpScewhaKSuFVOIjIpbygD81/D54Y2Pc/FIuKBl0AUOszSs96iVnNwa95x+\nkTNsdMbv6d4fe9SuSCu04lp7/hiTDMnC96qHEhl5JXTErYGBrZ8ALubv1fstP+gN\nhSd5wN/rBk2Y9140ih1wz59c1nodrgDj4ueTMER2cQKBgQDdlayEQyLJsEJtwFRl\nmPYnKsZTqIpyLjcgK66Zl+S+5NSNGTEFrMabVrdzvK8pTyye6n94WLtFagD5ngke\nxUXDblbwNpDw/ClqgNe/jxDNf9akhNJiJJxwzqT9bx5VnTGgbIYCkOABeRNaTL4g\nCe9necdkGjhek5UPsaV0kcCRVwKBgQDX1S3p/F0DbdKkFxve9SLZ9uvQhwa0AZTO\nb62tV0kLsLPVEO9ZEvkx1AXBzTCkynOgPDs8S5CzTagBu9VVl7B4Quy4ebHQAR8L\nMwMKVU6xVIDENLO4pSzOSgAa5A1OOM/XoYEVIY0rMP7fjRMhWNU4k1SI4xvL09Cb\n9bGQDyvHJwKBgCcwnKV71kBDq0wL8yFQ72A4AYG0UmAlalyHPUcvBSb6A9m8td3i\nE/JPYPzYR0aQGT02DjtzvhNlzyxW1hgaHd+VuUyc6f+lKZILnZzkqb0euhC46Riw\njvaopaepKn1L4wYTi5QSmXvJNTIIVqwF9dCgSjKbLJMVmQyAh9nZGWzbAoGBALlU\niad5FxmBrTVPzpPl5PZK6/TUbTIWhYO6K+VDpSqPoevcLdpLy4U47XSb0CBA44Z9\nEdRVgrwke5Z5hteHeHXb6c8CWGgm/lQsinjOBdOJn0RbiNONqeq9ales6av4Zqhf\nOys88y5aVRD636lr0TNSd21PrqeYi3HQSJdOH6ZTAoGBAIFPkVM6jHlFuH/J4nE4\n6OMEPlgbXxW/ete7WCCYykNRn/EtG/WUvAh3Rz6hM2O4gG9V9Pv21Ms3A6wZrJE0\nei2pvxnuezDgVqFs26Jfa3ZEsU9VPB8Vyzpa2STMjUT8FBdQlSFIWuHAMUCiTnHQ\nGymSToxPD4flObiomDfrpjym\n-----END PRIVATE KEY-----\n'
      client_email: '1006644991127-t54mpm30tudegci4q7a6cmvpgmo0oocn@developer.gserviceaccount.com'
      client_id: '1006644991127-t54mpm30tudegci4q7a6cmvpgmo0oocn.apps.googleusercontent.com'
      type: 'service_account'
    my_sheet.useServiceAccountAuth creds, (err) ->
      res.send err if err?
      # getInfo returns info about the sheet and an array or "worksheet" objects
      # my_sheet.getInfo (err, sheet_info) ->
      # 	console.log sheet_info.title + ' is loaded'
      # 	# use worksheet object if you want to stop using the # in your calls
      # 	sheet1 = sheet_info.worksheets[0]
      # 	sheet1.getRows (err, rows) ->
      # 		rows[0].colname = 'new val'
      # 		rows[0].save()
      # 		#async and takes a callback
      # 		rows[0].del()
      # 		#async and takes a callback
      # 		return
      # 	return
      # column names are set by google and are based
      # on the header row (first row) of your sheet
      my_sheet.addRow 1, name: 'stephan', (callback) ->
        res.send callback if callback?
        return
      # my_sheet.getRows 2, {
      # 	start: 100
      # 	num: 100
      # 	orderby: 'name'
      # }, (err, row_data) ->
      # 	# do something...
      # 	return
      return
    res.send "done!"
