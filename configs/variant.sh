#!/sbin/sh
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2014 The OmniROM Project
#
# Licensed under the Apache License, Version 2.0 (the "License" >> /system/build.prop
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Allows customization for various t0lte variants.
#

CMDLINE=`cat /proc/cmdline`

props_gsm() {
echo "persist.radio.apm_sim_not_pwdn=0" >> /system/build.prop
echo "ro.telephony.default_network=9" >> /system/build.prop
echo "telephony.lteOnGsmDevice=1" >> /system/build.prop
}

props_cdma() {
echo "dalvik.vm.dexopt-data-only=1" >> /system/build.prop
echo "keyguard.no_require_sim=true" >> /system/build.prop
echo "persist.data_netmgrd_nint=16" >> /system/build.prop
echo "persist.radio.snapshot_disabled=1" >> /system/build.prop
echo "ro.cdma.subscribe_on_ruim_ready=true" >> /system/build.prop
echo "ro.config.qc_lte_network_modes=true" >> /system/build.prop
echo "ro.hdcp2.rx=tz" >> /system/build.prop
echo "ro.ril.ecclist=112,911,#911,*911" >> /system/build.prop
echo "ro.ril.svdo=true" >> /system/build.prop
echo "ro.telephony.call_ring.multiple=0" >> /system/build.prop
echo "ro.telephony.default_network=8" >> /system/build.prop
echo "ro.use_data_netmgrd=true" >> /system/build.prop
echo "telephony.lteOnCdmaDevice=1" >> /system/build.prop
}

if [[ "$CMDLINE" != "${CMDLINE/N7105}" ]]; #t0lte
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0ltexx/t0lte:4.3/JSS15J/N7105XXUENA1:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0ltexx-user 4.3 JSS15J N7105XXUENA1 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=GT-N7105|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0ltexx|g' /system/build.prop
        cp -R /system/blobs/gsm/* /system/
        props_gsm

elif [[ "$CMDLINE" != "${CMDLINE/I317}" ]]; #t0lteatt
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0lteatt/t0lteatt:4.3/JSS15J/I317UCUBMK6:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0lteatt-user 4.3 JSS15J I317UCUBMK6 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SGH-I317|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0lteatt|g' /system/build.prop
        cp -R /system/blobs/gsm/* /system/

elif [[ "$CMDLINE" != "${CMDLINE/I317M}" ]]; #t0ltecan
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0ltevl/t0ltecan:4.3/JSS15J/R950VXUBMK3:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0ltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SGH-I317M|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0ltecan|g' /system/build.prop
        cp -R /system/blobs/gsm/* /system/

elif [[ "$CMDLINE" != "${CMDLINE/T889}" ]]; #t0ltetmo
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0ltetmo/t0ltetmo:4.3/JSS15J/T889UVUCMK7:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0ltetmo-user 4.3 JSS15J T889UVUCMK7 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SGH-T889|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0ltetmo|g' /system/build.prop
        cp -R /system/blobs/gsm/* /system/

elif [[ "$CMDLINE" != "${CMDLINE/L900}" ]]; #t0ltespr
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0ltespr/t0ltespr:4.3/JSS15J/L900VPUBMK4:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0ltespr-user 4.3 JSS15J L900VPUBMK4 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SPH-L900|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0ltespr|g' /system/build.prop
        echo "ro.cdma.home.operator.alpha=Sprint" >> /system/build.prop
        echo "ro.cdma.home.operator.numeric=310120" >> /system/build.prop
        echo "persist.radio.apm_sim_not_pwdn=0" >> /system/build.prop
        echo "persist.radio.no_wait_for_card=0" >> /system/build.prop
        echo "ril.subscription.types=RUIM,NV" >> /system/build.prop
        echo "telephony.sms.pseudo_multipart=1" >> /system/build.prop
        cp -R /system/blobs/cdma/* /system/

elif [[ "$CMDLINE" != "${CMDLINE/I605}" ]]; #t0ltevzw
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=Verizon/t0ltevzw/t0ltevzw:4.3/JSS15J/I605VRUEMJ9:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0ltevzw-user 4.3 JSS15J I605VRUEMJ9 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SCH-I605|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0ltevzw|g' /system/build.prop
        echo "ro.cdma.home.operator.alpha=Verizon" >> /system/build.prop
        echo "ro.cdma.home.operator.numeric=311480" >> /system/build.prop
        echo "persist.radio.apm_sim_not_pwdn=1" >> /system/build.prop
        echo "persist.radio.no_wait_for_card=1" >> /system/build.prop
        echo "ril.subscription.types=RUIM" >> /system/build.prop
        echo "ro.telephony.default_cdma_sub=0" >> /system/build.prop
        cp -R /system/blobs/cdma/* /system/
        cp -R /system/blobs/vzw/* /system/

elif [[ "$CMDLINE" != "${CMDLINE/R950}" ]]; #t0lteusc
    then
        sed -i 's|ro.build.fingerprint=xxxxxxx|ro.build.fingerprint=samsung/t0lteusc/t0lteusc:4.3/JSS15J/R950VXUBMK3:user/release-keys|g' /system/build.prop
        sed -i 's|ro.build.description=xxxxxxx|ro.build.description=t0lteusc-user 4.3 JSS15J R950VXUBMK3 release-keys|g' /system/build.prop
        sed -i 's|ro.product.model=t0lte|ro.product.model=SCH-R950|g' /system/build.prop
        sed -i 's|ro.product.device=t0lte|ro.product.device=t0lteusc|g' /system/build.prop
        echo "ro.cdma.home.operator.alpha=U.S. Cellular" >> /system/build.prop
        echo "ro.cdma.home.operator.numeric=311220" >> /system/build.prop
        echo "persist.radio.apm_sim_not_pwdn=1" >> /system/build.prop
        echo "persist.radio.no_wait_for_card=1" >> /system/build.prop
        echo "ril.subscription.types=RUIM" >> /system/build.prop
        echo "ro.telephony.default_cdma_sub=0" >> /system/build.prop
        cp -R /system/blobs/cdma/* /system/
fi

rm -rf /system/blobs
