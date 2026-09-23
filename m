Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603D576ECF
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 22:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201072; cv=none; b=ajaAT1ReXDUGi6onsnGfpO3QPrCMgB+YB0e8wEUTbX0TwP5soTxHKmXV4Q4oYzUexrVXA/hyIIuvhSK7atfZ2bJBg14A0cJvF2pCSQ8Ols1hAE9hDnghSOWkC1AeupH5iMuomcpzpyxY+LWwKRBOA7ck1XxEGKRGzkAYwE5kjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201072; c=relaxed/simple;
	bh=oh1uRWUKAGixSR34GxD7EUuuW43kClpI615CBwPotqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByPB38qMO+BMUcR9sxVLMlsK4ldIU+quOd4QGB8Rep1GiUayk3KDkgMGjF00Ni8rj6Gh/sYLZ8+bsm42vIIKgjHLdvnOeTfdIuSKZjrtjpfCFJaiDyehdUQmkaT11soh0U3d+LTTwGdx6hDKl0wARo5wU4kTwtir/bHghddk8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNOQzQuM; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNOQzQuM"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so161786eec.3
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 15:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201069; x=1790805869; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UC8zhHkQW5NQt0Vvfz8XdOU2ThXF2ueMEN7kM0d3NDQ=;
        b=pNOQzQuM/ObsEgxYRfxVkA/tjztvaVizd18/trfclBFkwL0U64eoCgMqzt2t0aw4q+
         spyUhTN8WDj6p8DfzZ5EMdolmyBPGkst41g9YFXZRmsecj++G9zKbG8z5k6cCKj7OCPX
         N7X8Ha07zf5tBcmnEk3oX3WVQQhza+MVElW+EOtFqxfrnUN1EiXxluyhbZtji5LdH8RN
         FVvE8RUQAev3RaO0V+enGxk5QvjQt5RT9IebtrML5zZpDCA7YcZ/zmxpVEDX0ATrBqJ2
         z35cB+VUmsYTxKLUcPFoxmiMkqStNEDfd8g8am9DdtXtx7Cb490lEqq8ALU2EIy/+9KO
         p3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201069; x=1790805869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC8zhHkQW5NQt0Vvfz8XdOU2ThXF2ueMEN7kM0d3NDQ=;
        b=iaDqbEuDxl95FOioFLkxYZmM5QNtOvJUkK+l0ta4td2HWNjr+aDAqj+Dx7m0yqWANT
         D1PS9SmTXYk6jLJ7NFmZc6ieifQ5qqmJDRXiINhgfUhRvbwLPzXraMg1oZrJzzpruoTC
         5/4572TvC5Vvi+8huPOqTimcBKpDOQyThoAIyPLlttZ0zcUJ90E3uQaoXLorqbQmnw1z
         efE1mBy0jJ8tH3LBEvcNbUQdebX9MZKcuLhANtBxxdNRQpSHEHVJWl3EkzaZ8pcnG7Pu
         x8OnRpoqnVGzoJW4Jqvl1OhwuW0ba6go9BIlec29RD5P02J3jky+Vd0ZJw96cO82x4TJ
         vrSw==
X-Forwarded-Encrypted: i=1; AKwUvBycw6WVBAh44YmVQZVIm7E6CSv2npvCoBZLRpzzd0eFWd3W+xHhzE5m1pgEuWbq41lDksM=@lists.linux.dev
X-Gm-Message-State: AFuF++n0H7fpWCX8FuwFZhBbOEWE8ZikbcFSve1KcPaQV5JlTQ6JG5cN
	QW1lcRDduU+GhNK/yM5vkM4xXdzradtgZS1wogpLWID10vlhD/PSrLSktDPvhg==
X-Gm-Gg: AYBFou1b2p5Xe2kfcu+saIzcFkCej5Ha7mrKhtzImC06nWfw2F71cace9wEoQqzlzCs
	m3/NAGL8W0RhFo/pZrnoKfX/H5KVGRxOcCJr7h18siO+l9vg7jyta2nwngl047nJcWr/qoCCLSf
	wrsjNeYG8UcG4tuSrtY4A3z5Ft9VqI1MCFdhIIl4SVgmcaz6rhV/1dygOEFLcuVJnSB0EA/ZeJC
	McL+lfCjknh5s6CwTKzWaIBr7IwsQqXs4zcyy4M4P12dkEhuVvE++1pm7P4/dsSWcOa+Qo/7As8
	64WGopM9ufH6nemYhOmvnzAX+92nsaFGdD9iLdBAz3oenyae6OLCO4tz7O9UmA6w4CcJetLpVVN
	ukW8L0TOHlGhBd8V5vfYgtQtb/b0ZfcEuur5WJ1VlFtiepj/Iy2qH93xJbsZ6EeUZX4yqgE36x9
	cMsnVPnN3XUueX/ZIBOCkLb6IgKQNCGIYWAKcOAOS0b7IRlHoDClDTg4fthNl7osyt2vffBm726
	U/IulbC
X-Received: by 2002:a05:7300:f814:b0:328:3796:7f4d with SMTP id 5a478bee46e88-34001221cc4mr561468eec.2.1790201068751;
        Wed, 23 Sep 2026 15:04:28 -0700 (PDT)
Received: from [10.197.48.252] ([2409:40c2:5047:8a3f:9ef:734:1515:aac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7962458eec.8.2026.09.23.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:04:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 24 Sep 2026 03:33:31 +0530
Subject: [PATCH v4 2/2] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ti-tps6586x-v4-2-6c7a8fb8b646@gmail.com>
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
In-Reply-To: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790201024; l=3311;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=oh1uRWUKAGixSR34GxD7EUuuW43kClpI615CBwPotqw=;
 b=uxszv7d1V/uZD/9TZRa1ZPHNJ7u9o6gnMu86wq6T5+Q93wv32efYUXITAjv0tGHwlLraiSBRn
 hPQFzwtSIA4AiV50xqdhPxSGwJcT9TPLCxWImedWvfury7RyBXvsWJu
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..209dc97909bf 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -97,7 +97,9 @@ properties:
     patternProperties:
       "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -110,7 +112,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -123,7 +127,9 @@ properties:
 
       "^ldo[1-8]$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 0f2901cab8af..a2778c35919b 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-4]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150..6768fc6ea0d3 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
@@ -20,6 +20,7 @@ description: |
 
 allOf:
   - $ref: regulator.yaml#
+  - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
 
 properties:
   compatible:

-- 
2.55.0

