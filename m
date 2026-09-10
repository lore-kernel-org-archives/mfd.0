Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD163BB109
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032711; cv=none; b=uZSBCAmnZ1TV9rmXW9jlRCv9lYn+MJSSQtrwNTQM7jqdX1ixAQVaE2cKIELiwJyYVVYRGV+NtkrbNa1tE0O0R0nkOoNJS0y8mYVJSf6x8RxLzdDppzsMGQ2wjhZKk4z9iDax5L+iQVdeNtISwqwfIMLuCtC+0VLuKhI+X6TMH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032711; c=relaxed/simple;
	bh=27AUzsKR9CssdEaQkSlsPLqzbRGUpmaiIW0xyEpwgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJaU/xqPvdRB9NVaR9I18ACD6/6k6xtdfR9danUh4d2cqBHAAaBB89uVkIttBqoWnKMIpoD+2Ueu5ukTO/5oqKFUCJX2GjFVT6SmxSc9eGr+w/Yl9LlfMcRbSIQgOq/jnXePGG0LPKxek+80ZhKHD7CoZz4iFjjotR/eluOWAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hwN3LHXB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hwN3LHXB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12512855e9.3
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032704; x=1789637504; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=hwN3LHXBUBq1WKkRi5s1rSV90VvNlHrC4BNi1V8JKX5M5q/D7n+A46kUjA5ko4aoP9
         iz/RcEtLS3++x0m+cONA1RBJ8/7IYHF4L54ltc5X75uH64dukMz9QG1wd2Ds2ik57nJ3
         4gwHKgGJfwLWTcCxKE5qCPNWR6xtbqb+c6Xx1/FKJotWTUTEsrvpzj51e1sq5nkU5daA
         EpV4md74Djzy2MsNloLfXGxszqrPGHvRtNr9N1Jx/TUVVf12L7BETQUjDAmrmZ17UHS6
         9NJI6W/IgF8BJjUUqJB0t1iw2tqnZ6X+TOY3/Y5/XJBc0T9IPyfTAsziOK0SQCNWEt4C
         OUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032704; x=1789637504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=n9vIptvMnjrcmSEutteNguS0BcQRXC8joopNlyrnhTEDXfFyItN1t6HOtgMeE8VMTB
         vQc4wtwnzr6YHKBSWt+HD130qEfvyQlrBWJ2BD2TS/V9cWEdtTVXqqBKtKhlpu2AvHOT
         Pk/qJooO4xgLm7RPre0q1b0d7Tcd/1tPGOIG9E3Eal4lcnPTx/89HticpErBpWso8OmL
         xLvRmJz/McF71+Vaq3vT3MMWcFyVfGV03K58S7agZttlHjV1E+K5OFp54GqI9FihIwwM
         E4XydUIQQtEphnCLv4b0XPCjWnrfEeYJLoRoIMXs9ofMLWuTQ7XyRqT04gU6xKvtyOyl
         jRjQ==
X-Forwarded-Encrypted: i=1; AKwUvByIIBC7aZ4Di6lw5b5BQlDS6U9QDuqbkWcRqjDc/vG2aHl0xsliVgHu5t1Mtf1RKtkrBIE=@lists.linux.dev
X-Gm-Message-State: AFuF++nqwaELNN96BOkNSoFwnqEnyyyzhae5R0m8Aw9eTwCTN7qk5bvE
	dTtyCjlPZEvMVw9T7rj/44TDLzBHqT18PKEen8ZXwYgJ22ChOdlkkoDG2+p40u980gI=
X-Gm-Gg: AYBFou10RI2UOSXXQEhfWnYq+5NWGCslTzQKReern7YFjvcB2IiKoqMDsxrALxWDKDM
	KdBe+fqlh9VZ3Scs4dWZVkRCryOvMNtoxoSIeCgQQTkxLiCDbNiUFyh4YvQ/s+caEj2dGP7rgEA
	8jkwKJVI9bRMQ3lAIun6q+EhAevmc0nSeL7QOCCOAnpfj+50ZnG2qKrAnG5Sh6DuieO02/KngMf
	SMqHsiPVv48RsR9MK+LFDOxjlgbrmo+kyea4KpAcBq/TLMKr1AnaFZm/aaDP1Ofn4yhWnOPNub8
	IAAjSxgnkO04O5ZfhSfnpMWx0MXxYGJ/AYDYziZh/+vNBYKD+w9vJ/rH8/nji2xBBcBUjXWvgW6
	pXny1dhsVXqwLV190TrH2MxAkQVTEesYI2QS7ui56UpHImsoh0CKeqabvAvU+y0qY0+7oyzPXTs
	6UgnFXPUmCqkwY5S0y9zIcp+jxDKFA2Tei67wiD24Y8SU8VO2XX+yMKqAyKTOh0efSfDnP/Jd+o
	w/ZgiWmGdioeA5qeg==
X-Received: by 2002:a05:600c:c48f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49d258cda4emr58183465e9.6.1789032704515;
        Thu, 10 Sep 2026 02:31:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm54965505e9.8.2026.09.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:10 +0200
Subject: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6eSLEgss9n7JCsvVnaFzT4hYnTeTkd6TBh6eqWPLl0E=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjwMfjSAPRNpZoCxaIrK3onAQOeCgr2fiRTu
 ejAQpLKhbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ48AAKCRDm/A8cN/La
 he5CD/0ZJJKGnyLNZ+C4njPLmH4FrE2JTONJCh6Q2ouaK6jRE1+pKnhUOJ5/b9ZA8VUJX1ehb9Q
 VJEGB4+eQNZG9vKc4z0EsBnQgj2s9HIG5v5GyvSskGy1yqQ6PTyoOdWGKvN+6ZlCT2LRmJkqYxf
 qvV3vH2H79OvEBGTGWZgjFmJEYOyjpAITKCcfNsD4gVAkohoVLbOMa90BVA1LH8MeRUyxFMDNC1
 PXfKfC1rvi2Mh1x2wC6qp7Kc/iGMzLweL8MmkOSzEOvDUHSNeoNqrqQS4u9N+jJRssKjXxGlU2S
 4Zdc/aHaFkKBTJoOXpc6B6bhBp0du2h+opFJURQTpHXo6sx2J0MpnVQ3ZX9yHCDDdLkIHdqWMq6
 MRySKTofNx592rOO2KYXplXC2bTsKcvXhfM7KQ/EKu9LrgAa+bqTlGx4S+k1cVjz3+kSCMQRjX1
 ZwQGK8t/oUOB68lyiJNEYCYGpiyVqLxEKqHbsNzP02paU9t5bN35DjhIcuqTNlCGSEuIDKnC+9Z
 DuVZSwRcUftsAF2WKl8q62wJ85l4RdFXUhWPN9GWR9LC+DJO0B4/5n4iVwTTNJog715QSMjws/A
 ErzwlN7r1+IKfRJbZGUpGOoSyu6FbWGyh2YZ/bSa153RVVr9np3Yo7/paNDGW7c4854M7dtgDg/
 qslxEgM3551cxww==
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
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..38556c32417b 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -83,6 +83,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +103,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +158,18 @@ properties:
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
@@ -168,6 +178,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +190,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +238,14 @@ properties:
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
@@ -277,7 +303,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

