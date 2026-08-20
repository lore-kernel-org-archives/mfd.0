Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8DF43F0B1
	for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228754; cv=none; b=bppGzzSXMaas6UW8VhopHQp1sDpmlvU4Oh38QmjsE9r1rMfdjjmpbcVxUFpnd+OO1uRXX7ElSgYYSo9UoVGo6O1opAJxFck4ivxZ+KFwbtzg4sr9WHAw2JdgWqI92bEfJ8RFYM7xsW8vkGIHVmPNSqRzC224x/p7IqBLpyvoum0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228754; c=relaxed/simple;
	bh=tfTNd5tjFz9L3yETKktoI1guJcDo130AJeYFbFp3xqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDux4UbXM5K9UUWtSuQTb9nPsIkl34tX4Xrn/kNj/K934iF03AT+Ak+aSdWJQ6kvOofHXy4jdDNrSnxNeKsnJfMOIpP1VIG7GelQ9F8uJQ4y2fdrcsMYI9A35P7A7AknMmWZzDpX/vvqlQwcNe4RF6XYTbWYTYBmNZYpjofQXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCB0fOqt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCB0fOqt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso781358f8f.0
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228751; x=1787833551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=hCB0fOqtJE3/KbtNHlJY8CTlzu7B7M/LkABkSTtPUg2/eECEXTv/DehiRyr9jap96j
         +0Bt/WWDHqUivbQSv0/K4KrODf4ROePDnFDkje5Y3PTRp1qwqoNZzZ3gj/W/8p/rEpuW
         RXhrHL1YwzwydyrIDoGUO6mfPqGeDy9BlUBkOF4noH5MkBvaDwuSfrL+5apYrYlvXaht
         9QAO2Dihj3eodbWuIqgDHcjT6tWBzw2oMt/x8xvwPP9jEW47Z7bOBUWlwQGv9EGczozU
         XsrIk396o/bnVDCogIPN7gm6jb+U/mz2GHQwqrcgCWZQ7oZc9zKo8JWLNPyBptAqlKB6
         phnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228751; x=1787833551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=n8iHsmVAabSvbrVsfzKdZk2Vt3irWXa+TG1r96nKeVVbTcbbP4in4K9K73HP1yFDJX
         f8lUY2RklCCIYqR3eKX0k8T3m55ZqYHEx4KLNRQV+L76bFu+QLxV7SOlsxyJCx6o1WME
         qes96ygeZ8WAhr94oCB38iJuNNm0vPg+Fj/+m9zcAs1w6i9i7Mx/vFDtqbOdBYWTx83A
         e52KMzpBHaB1sbi0fWM/vQtFQBOOGElU5tQw/nQkxDiVnfP1ggAJgWhw2a6yScTvZXRt
         dqxuufjZ97SyCwabDXGGcw1XzWl6Bcf+m17ZefEognkarfp+lgCNo4wPI/SckRPgfw1n
         nuoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCEm7p5JT3OVoP9nvZLHjBnk7Mi45gpBvyJIgnXHZ/NMTxIXzsmE6J4tWHxz+qLB+PUUc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4DSfBr2CN13xhFJhGt/Wu94wdxXGWTo7jxE3L3B1YwU5OMarQ
	xDeMltfI+Jks8QnLqymG1nDG7NfGkfso/l5Fd85OPWFyfyAgmntgk9uc
X-Gm-Gg: AR+sD1279+Y3Jf4syYIKIN7G0jM/EH9V3dJKqPx00dduc3CG3WG4xGpDLU0/8ob2Llc
	WeXvoV20ArW3aGmqethMOHkQk78i66l+bS/RwjjGej5gLauUx+7l5aoZe3rdGhALUH7CL8XQcpA
	oGUORYDZYQ9KDerGhxbIUeVbTYUU9iAmdQqSlLEKCtXJ9A3oO2JVRy9VNaW6Xxwp8ph2Yo1hEBx
	nWPZPbILTymEmov6nuKm9Cl9RdI7NmlPk2LdWgBGv9praWKQMt0G3KE0iox2XtXW9f9vZIim8eZ
	7qNWM4klswPz3VhmXDP5XEWEpJmAXmy1662ZUCAkRzqLXgt8NaI4MIbfES6mNg3OJAoxHK262jX
	+D3iipPSiCXVdUEyfsH6SWGEbsYSjS+AUL8wM3tcFp7OvEQFaN1kMDX3KJpzIA60PF35yAaO5je
	y/LMtkbnN//Xq9X6Yv8iz6zTUIm6+X3dImTE2008n0/QuHMpiA8g+fcQ==
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr243508505e9.13.1787228750345;
        Thu, 20 Aug 2026 05:25:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu, 20 Aug 2026 14:19:59 +0200
Message-ID: <20260820122242.120039-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..fd4b41bd3716 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0

