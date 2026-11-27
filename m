Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775873;
	b=0BLSGH0YAMt6H0zVe+A4vagKch5JWXsBcIM5chhNixrefKXonlP4tafWbKfuL6lqMjJn
	 I8UWI4pr27iksillxtGcEwVdY6q7nEUmhz+6Pqci96u0qlKeAXeY5uw6ReZxxI6BgUNeU
	 kD24wep7NaIftIHTQ8X+PtDwZvV8ljhEiQFjM26pZjeEyWmL8HIKqq46nypHZXfnkpg2c
	 swCymzm9lJyYY3B098wfbkut/bcJXmamPCLJdemU5cBhojofXrsGqRsew4R/2N3dczB8l
	 4SUTrHX1D3IU42gUOYkAdtHCXLUoz+r2UKD5lBnlMOeFzW6tI3ndG4h/lHDCg0BKw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
	b=IluMOZMO7PaGj2I6RazBNGUyV3AShNe/K4YWxO3jkTyOGVzwYpbeAJGoH3/hc3nF4WwW
	 oUPxuhh/s6Rz2/8noODNYhmJ6sGNvebg/hXa9NEuRM/pacwkBnYXy36TevyhJyaqUIHob
	 dDvjYnWXlkaoqgCMI7ikQWdPOEzMpRgJf+sKx46qQoHQKTATCN3x7Q96QRhxSKQSybh3e
	 x5akHBm3nGxXpLJ25tYjRpUDjzi0vvMuD8+o7zwa59xprzhN3rl4H1yMjzMW+35i1dyms
	 JmvArF0JzEfc7eJ4XT2LwUScepUkwELFdWf+iPT4zWFyQxox0Breh6jS3fRxXWlbh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PDxOvfCj;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25D606A329
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 10:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C25D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PDxOvfCj
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1496130066b.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775872; x=1796380672; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=PDxOvfCju9Nk6rkPTrn8Jr7J8p2MKFmqCR1hobYconi0HlUDLdyboOJ7FfAkv9TxEO
         1NnvqxwA7yCwJIaFZgfda3y6EgZXltJIkA23IZD4gSJh9e7p8Bxtt8y3qKOW5BEOdmbI
         vG36s2RH/3pt3VMioAZyXL8oJT7cJSCZC1XJ0A3J8p6AcAG2f8XoFZkkdpMe/SEdEw9p
         MXuTmSlaN3DrJdnprLQknpUKWXJlHWFy/iRHZjfUHTN3v1Eehp1ui8FjSeJcxvG5Oo0j
         Dh3/3+gt1pcHPrvfrGqA2XMGHChj9/l8tueTcqsxb7hgn5g4lXkI2TjQunnSEXEPYrcC
         09kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775872; x=1796380672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=d0Hi7xo8AdDeYjbI9zAh+aJ66MSaMbZP4O0mrObJaSgFO6YGnFtgJ0h03IXr+Wc657
         8eCMF08ZNf4QxwfdVhqkpQaUMHXiQhZvTJhKc4C6IJ1c5NRK+/R7hWLjkqPX3WzktWJb
         sZaKHmAEI7Aau2byMBLUh9e/JU7Pu2zznkzpV8MEGwfZZd4WpECVV8frItQouLNDZN2c
         9rl2uUDOhzPkQ/OlslKunS0zr6c73XhkMY7KAHy7QU0LUDhM/dzq+EgdyxPk6XB2Vm4y
         3NPCWW8EN6BYYsDtEt8OoUhZliHg7Iy+JC4ivWRMDRD+TD1ZTMxP1wiYp7N2AFcmBbUF
         zsMQ==
X-Forwarded-Encrypted: i=1; AL+hErE/HJ/oE0+lZq4RobwBu5b+Nr9dAJZBt/I6IjFuYNkvCOmHbeOloZQPR/ywfq7O3u9kZ2g=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ArfPbmYpXhQHWpZUCnS1Ma5KdeEg3zgSaG6zMxs5S+IjrQBuv
	D9fdBWBcErF2/rK0yUv/iuA20ZWI2ppRkLrIAdfmLcoJWcGQoPXAHDlHRe6RRh+FPVA=
X-Gm-Gg: AZFdTZdj5T+7gPN5cCKiKyCbc0NZ4QMyljYXrTgb15kV+70Nx9eK7Ovc7bwp5CvVOg6
	2xU5gcKgDSrWRh2uvQKHrzIMbbiANzVgZuCTzHiYEehnITOfJLz4EF1wnWwPAyrg0sClAVKBLBj
	7V0YS2LBpd4Eyo5YDCKwX/TTOpQNjyBsYL8jXnV8iSczWDrJg62wA7zoxLmYEsrWEtpEZIGMVqo
	05IDaAX5WoYrpHV+X0gmhBtk8QIfWyu+XphdVClLsSkauDTOWaWYDSNeMWG+vDSpuX1OyBda11x
	nl/IXgUossuu4GlokRxlnsmgvuqJ1RsWtzpXQYfDcjnCj6Mq1gHOHynv7x1xAdhg6yE6i8+El++
	n/Jnbq8LhCPH/B/YZC+Mlvla4n6y0k+pty3oKfXLyaGI17n1xxLptATm4Qfw8bB8csoNmYe5z18
	WF/OsExwOAKx2P1+1FDrJFlvtcgvg4HGHRXE/TX9Pu8ACTs+7Ytd77u9xnlGmYo4mT1GOOaV5g4
	CVXDFx2wwNNp06COS0q6xY5vVVC0jOLwfJjoRXTgA0KE7SqlWDqsMOgN8l8gGZGX/wMWFRhA9aQ
	r1Dcmz+BY8KyQq4rw4XuWan66pinOoVWkvJtHc4TI7PWLC91qswLjtLUYehj5AXTy9mWWA==
X-Received: by 2002:a17:907:6d0b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c51317e3353mr2141842866b.9.1795775871729;
        Fri, 27 Nov 2026 02:37:51 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm37268558f8f.15.2026.11.27.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:37 +0100
Subject: [PATCH v9 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-3-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBdBMXYah5b+O3yxBs9VZHzS2W2px3jjTuPIQfDgazg=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVWHGj+0rDxbI6v66P+Cg7NkLsvJ37oV+CC1v6Xxz
 pOrc7Z+6ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEvDcxMnz72vG9/WJDlE2+
 XXHWnIgJ0vtyy0x1Ip5aW/yJYuBTiGf4xcTLljotyK+GTYeL121OwduZa7Mkyo8mLm9Zu0vVW/8
 zNwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts.
Like other recent PMICs, it lacks the DC/DC converter PWM frequency control
register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).

Add the new compatible string, and add that to the list of PMICs without
the PWM frequency property.
Also add more input supply properties, for the split DCDC and ALDO
supplies.
The PMIC features *two* switched outputs, hanging of DCDC1, and the
manual calls them swout1 and swout2, so follow suit here and add those
names to the pattern for matching the node names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..edca6b1e9f70 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -70,6 +70,7 @@ allOf:
               enum:
                 - x-powers,axp15060
                 - x-powers,axp305
+                - x-powers,axp318w
                 - x-powers,axp313a
                 - x-powers,axp323
 
@@ -83,6 +84,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +104,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +159,18 @@ properties:
     description: >
       DCDC1 power supply node, if present.
 
+  vin19-supply:
+    description: >
+      Combined DCDC1/DCDC9 power supply node, if present.
+
   vin2-supply:
     description: >
       DCDC2 power supply node, if present.
 
+  vin23-supply:
+    description: >
+      Combined DCDC2/DCDC3 power supply node, if present.
+
   vin3-supply:
     description: >
       DCDC3 power supply node, if present.
@@ -168,6 +179,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +191,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +239,14 @@ properties:
     description: >
       ALDO* power supply node, if present.
 
+  aldo156in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  aldo234in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
   bldoin-supply:
     description: >
       BLDO* power supply node, if present.
@@ -277,7 +304,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

