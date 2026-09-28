Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF354F68B2
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625505; cv=none; b=Pc7c4Ltkd2cqSb+zX5+p9ZKYWiSpaRDkcSOQyBk2wZlObz6s0oMEgTm0aLYhZFQKUWEqXu8m0P8spbuEshaZ1Sq4dgnCuBMUAvCRq+eIMHEM2r0XXv1okhr08Ynm5jJ2roYL9eN/5rpmgpnTJP77Cf/9EVNQQCytjf7prYZ19oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625505; c=relaxed/simple;
	bh=nJKy7awCkFp/0wGYOmaZwSfsBINwkG2voD/p7fCsBKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g6HEJ2CCkVC68SsKDEcdlIqnxMw4TpLa9/TYPQ1HzMovsqFCJ0wELJ0LqmJ9wF/Q8il0zb7YjTRgS7vUsZRTMhA3rViQmxk7iMHev1r10VDSMkomsJdr+QnGVz6rlwx10NWyqntM9Dj720zX+nOcYMB8GRhc4MAbomeMKNwGqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIv73QyK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIv73QyK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso415794a12.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 12:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625500; x=1791230300; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+OXTYGXO6d9n5BGvoI6nm++IQBLucvtvGGFoxL0/Zg=;
        b=LIv73QyKFEW4wbrk/eKpWNmblphlFFEH991qRl4w4+MJ25bDS3mkVbPxfDVvnYdYjN
         8WUXtR45sdaV2yB+FrzqUHlw8Ylx5Mp0OLXbav4zNaIjyfATnn2dlXzWNr6XpZNPRawU
         POYItTg28bIDWqglRkIB5W9VqDvzDqq0yFXasGBiSoOCTabv6PyXOzegwhtf9fpDM14d
         ZoDGuYAlBunO//o6NNNpjyX+42Su+Q3w9Uu8bgJ+fezC2ol3VP8XsjeC2SHGvALuZ0Oe
         9TYRomFsRp8XT5pHz4GEsybYcDrijejjXlD83c6GZAPMMLQlEWEXjDy54CQ9WOWomBu/
         xt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625500; x=1791230300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C+OXTYGXO6d9n5BGvoI6nm++IQBLucvtvGGFoxL0/Zg=;
        b=Jzny88OUiZG3GphdVL6NY+4jHYVngcBG1qQm+wL1MtvpSrlaJSI68fnlILKlTGlJjJ
         ehY3EcvNrKeRx7zjTKblkrfappL6DgGsUhFFEtz1cbFGazGrMMFizpE9YaPja4pMkLwh
         I1dJ/zloC1auWhMTxYmREadaggTFBZEbLkZ/QTtpAFCw1VTVqjrwDo91dDR6VPyEry2s
         nCvGaXLEJ0L1duSUafSSUUEEoIA4aD4e8fagzHCjXY2+rdgvtgbYXxmz2NKH8UhaZUon
         SUxqHYQAQft5O/9nzKG8B4ze1u6D7MqUHIo8TrAb1s/azyjptp0vHbBN5l1A0XZa7NcW
         dnCg==
X-Forwarded-Encrypted: i=1; AKwUvBxlKFHW2EbsXKW/P2K5xKPS+p0cgkMsT1X7oBqSipBeltZqevYfOH/1jv/PfLk54htlhvE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJCntfKwOZjjR4Vn63+ilpN+YYuet6omFf6AsE7cumYZJIXFvMt
	nOPtg+WMIDU17aHLLV5Edk+6TGjJte4S5u3y52YO0s+P1CP+TGrc/E9b
X-Gm-Gg: AYBFou0oDn0YjsCrFx4xFr1swooF4ADN0M/ibnaGvc1PuBmX5l8xHlpWEi4V9JVwqjb
	EmBu6RkwE+09/lGP2PS+3Q7e32HUl5j5kttdkAGP8kQvmb29La2iq5BVS4BpfTQu/DZzkymkqaJ
	d3W7e3F+Hm3krCNrkkiISQzQYCmzuRTo87vzrxbMB/q9hFoxiwroqDa3y8+zjFgAFjQGZQvMw0F
	k6GtqfqwUXWfC19QiEkL3S5U4IRkz+fmuTqEz0HKFbyL5iKEU7gqdy6whCXdXheczH+2oMRhpfN
	e0AbdH0Hqf/q+h6t3xKZyAVT1JYi/gIMAM6h8FiJv14l9p0OoQ1HzFZ+nDFEjw/rpAa5HhalaVG
	3ZVXqBHev7i7IvU8w+DvUW+Rjk+k4lhdORV38CCE/2ZeIdNRfJe96Frrcpa4f5lGHIXglvu5Duk
	rRkV0QlYE6Q5MXVDb/od8kRJa3kw99yzWH5GxDWnJ+DhoS63h7zqSbhpOtwBilMYwcCtE1CUQog
	SeX
X-Received: by 2002:a05:6402:a311:b0:6ac:8181:3194 with SMTP id 4fb4d7f45d1cf-6aca864ab72mr156498a12.15.1790625500281;
        Mon, 28 Sep 2026 12:58:20 -0700 (PDT)
Received: from localhost ([2a0d:3341:c720:cc08:a530:2329:7a50:d26a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd5e49sm4524355a12.19.2026.09.28.12.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:58:19 -0700 (PDT)
From: Denys Romaniuk <chiffathefoxx@gmail.com>
Date: Mon, 28 Sep 2026 22:58:07 +0300
Subject: [PATCH v2] mfd: max77705: Mark PASS2 revision as supported
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260928-max77705-pass2-supported-v2-1-c04f3932c182@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2JY9zeAUNKueo/GBSgoTRXCV2Njv
 HvRpssuJ3lvZiVok7dIbsVKkp09+jBk4KeC1J0eWgu+yUw45Rd6ZSX0elFKUQlRI3LAKcaQRtu
 AoFIyw51TzJF8j8k6vxzqR/VlnMzT1uPu2xedxzGk99Ge2b77ZcT/zMyAgRaydNQwYbi+t732r
 3MdelJt2/YBHwrZ89IAAAA=
X-Change-ID: 20260913-max77705-pass2-supported-40551b2ff71f
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 Denys Romaniuk <chiffathefoxx@gmail.com>
X-Mailer: b4 0.16.0

The existing driver takes a safe approach and only probes on tested
MAX77705 revisions. The only tested revision at the time was
PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
devices.

Testing on the S10 and S10+ shows the driver operates correctly on
PASS2: interrupts are registered and fire, bind and unbind release the
I2C device cleanly, and the charger and fuel gauge report plausible
values, charging the battery to the same voltage as the vendor kernel,
haptic feedback works.

Link: https://lore.kernel.org/all/20251023131732.GN475031@google.com/
Signed-off-by: Denys Romaniuk <chiffathefoxx@gmail.com>
---
The base commit is from the for-mfd-next branch in
[git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git].

# Test Results
Second revision MAX77705 can be found on Exynos 9820 devices, such as
Samsung Galaxy S10/S10+/S10e. Eric mentioned that S22 also features this
revision, but I don't have it at hand to verify. My tests cover S10
and S10+ devices. The tests should be exhaustive and prove the
driver is operating correctly. Please let me know if there are other
tests I can run to make sure everything is ok.

## Device Tree
DT nodes relevant to the MAX77705 driver that I used for testing can be
found in my private u-boot tree:
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L184]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L15]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond1lte.dts#L35]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond2lte.dts#L35]

## Interrupts
Interrupts are correctly registered and fire on both devices:
```
/home/user # grep -i max /proc/interrupts
  97:        687          0          0          0          0          0          0          0  gpa1                6 Level     max77705
  98:          0          0          0          0          0          4          0          0  max77705            0 Edge      max77705-charger
  99:          0          0          0          0          0          2          0          0  max77705-charger    6 Edge      chgin-irq
 100:          0          0          0          0          0          2          0          0  max77705-charger    7 Edge      aicl-irq
 110:          0          0          0          0          0        683          0          0  max77705            2 Edge      max170xx_battery
```

## Bind/unbind
The driver correctly binds and unbinds. I can communicate with the
device after unbinding the driver, so it's releasing the i2c correctly:
```
/home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/unbind
/home/user # i2cget -y 1 0x66 0x00
0x15
/home/user # i2cget -y 1 0x66 0x01
0x02
/home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/bind
[ 1481.988830] max77705-rgb: Failed to locate of_node [id: -1]
[ 1481.989191] max77705-charger: Failed to locate of_node [id: -1]
[ 1481.989549] platform max77705-haptic: DMA mask not set
[ 1481.990762] input: max77693-haptic as /devices/platform/soc@0/15d600c0.usi/15d60000.i2c/i2c-1/1-0066/max77705-haptic/input/input2
```

## Sensors
Sensors report realistic values when charging/discharging. Temperature
sensors are broken. On S10 battery temperature is always reported as
-20 deg Celsius, and on S10+ it sometimes changes when I reboot into an
Android kernel. Seems like downstream kernel is the one responsible for writing
the temperature measurements into that register, but it doesn't happen for me
on my S10. Downstream kernel is reporting the same temperature as
mainline for both devices.

S10:
```
/home/user # sensors max77705-isa-0000 max170xx_battery-isa-0000
max77705-isa-0000
Adapter: ISA adapter
VBYP_REG:      4.58 V
VSYS_REG:      4.29 V
IIN_REG:     466.00 mA
ISYS_REG:    233.00 mA (avg =  +0.25 A)

max170xx_battery-isa-0000
Adapter: ISA adapter
in0:           4.28 V  (min =  +3.00 V, max =  +4.26 V)
                       (avg =  +4.28 V)
ERROR: Can't get value of subfeature temp1_min: Can't read
ERROR: Can't get value of subfeature temp1_max: Can't read
temp:         -20.0°C  (low  =  +0.0°C, high =  +0.0°C)  ALARM (LOW, HIGH)
curr1:       253.00 mA (avg =  +0.24 A)

/home/user # cat /sys/class/hwmon/hwmon1/device/status
Charging
```

S10+:
```
/home/user # upower -d
Device: /org/freedesktop/UPower/devices/battery_max170xx_battery
  native-path:          max170xx_battery
  power supply:         yes
  updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               charging
    warning-level:       none
    energy:              7.84905 Wh
    energy-empty:        0 Wh
    energy-full:         9.85235 Wh
    energy-full-design:  13.2593 Wh
    voltage-min-design:  3.35 V
    energy-rate:         0.474233 W
    voltage:             4.10625 V
    charge-cycles:       150
    time to full:        4.2 hours
    percentage:          74%
    temperature:         30.8 degrees C
    capacity:            74.3052%
    technology:          lithium-ion
    icon-name:          'battery-full-charging-symbolic'
  History (rate):
    1788563923	0.474	charging
    1788563893	0.352	charging
    1788563863	0.983	discharging

Device: /org/freedesktop/UPower/devices/line_power_max77705_charger
  native-path:          max77705-charger
  power supply:         yes
  updated:              Fri Sep  4 21:24:00 2026 (6910 seconds ago)
  has history:          no
  has statistics:       no
  line-power
    warning-level:       none
    online:              yes
    icon-name:          'ac-adapter-symbolic'

Device: /org/freedesktop/UPower/devices/DisplayDevice
  power supply:         yes
  updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
  has history:          no
  has statistics:       no
  battery
    present:             yes
    state:               charging
    warning-level:       none
    energy:              7.84905 Wh
    energy-full:         9.85235 Wh
    energy-rate:         0.474233 W
    charge-cycles:       N/A
    time to full:        4.2 hours
    percentage:          74%
    icon-name:          'battery-full-charging-symbolic'

Daemon:
  daemon-version:  1.91.0
  on-battery:      no
  lid-is-closed:   no
  lid-is-present:  no
  critical-action: PowerOff
```

## Charging
Mainline driver charges the battery to the same voltage as downstream,
which happens to be 4333 mV on my S10+.
When charging wirelessly, the device accepts charge, and sensors
correctly report the charge current, but the driver reports battery
state as 'Discharging'.
Since the driver doesn't support Fast Charging, charging wirelessly is
faster than using a cable.

Changes in v2:
- Use plain && in if() as Lee Jones suggested.
- Use real name.
- Link to v1: https://patch.msgid.link/20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com
---
 drivers/mfd/max77705.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index e98c76d6b699..2e9b81f26414 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -105,7 +105,7 @@ static int max77705_i2c_probe(struct i2c_client *i2c)
 		return -ENODEV;
 
 	pmic_rev = pmic_rev_value & MAX77705_REVISION_MASK;
-	if (pmic_rev != MAX77705_PASS3)
+	if (pmic_rev != MAX77705_PASS2 && pmic_rev != MAX77705_PASS3)
 		return dev_err_probe(dev, -ENODEV, "Rev.0x%x is not tested\n", pmic_rev);
 
 	/* Active Discharge Enable */

---
base-commit: 5a5f978cf3cd2f50b9e123f851f5c6577519ee89
change-id: 20260913-max77705-pass2-supported-40551b2ff71f

Best regards,
--  
Denys Romaniuk <chiffathefoxx@gmail.com>

