
PROJECT_ID=com.u1206yaya.FlutterFirInstagramCloneCat
FIREBASE_DEV_PROJECT_ID=someapp-dev-dfa74
FIREBASE_STG_PROJECT_ID=someapp-stg
FIREBASE_PROD_PROJECT_ID=someapp-prod

config-dev: # Dev
	flutterfire configure --yes \
		--project ${FIREBASE_DEV_PROJECT_ID} \
		--out lib/environment/src/firebase_options_dev.dart \
		--platforms android,ios \
		--android-package-name ${PROJECT_ID}.dev \
		--ios-bundle-id ${PROJECT_ID}.dev 

config-stg: # Stg
	flutterfire configure --yes \
		--project ${FIREBASE_STG_PROJECT_ID} \
		--out lib/environment/src/firebase_options_stg.dart \
		--platforms android,ios \
		--android-package-name ${PROJECT_ID}.stg \
		--ios-bundle-id ${PROJECT_ID}.stg 

config-prod: # Prod
	flutterfire configure --yes \
	--project ${FIREBASE_PROD_PROJECT_ID} \
	--out lib/environment/src/firebase_options_prod.dart \
	--platforms android,ios \
	--android-package-name ${PROJECT_ID} \
	--ios-bundle-id ${PROJECT_ID} 


clean.ios: # rm Podfile.lock Pods
	rm -rf ios/Pods
	rm -rf ios/Podfile.lock
	cd ios && pod deintegrate && pod cache clean --all
	pod install --project-directory=ios --repo-update
	flutter clean
	flutter pub get
