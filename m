Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517809;
	b=qfKqOElEJUZCWVUdUnHZzmflLCj/frEVJwIlYZH45jIErElfF+LF+Y2dF5kpnZ3X+/4R
	 dcgr8L3I28OhZkYF5Richzjz0EcTO6+zmtYKoEk+Y7cTP93ZKMfDyV1MPDL1yshXw1FlI
	 Z3tFTjZsP89NlWczzGlyg+iAcdDFWF76NpuxKKTSikmZnEQpXLDIrHShX8M6SuTNcf8Nz
	 y3aXA3qIYxsnaDMzBWLPSOCYw2+vw8T26e9bHD/oG8qv3r4I8Qf2+RPIm7C7vYTam6/sg
	 YZqdK3ELGtxKctVkwKHvJ72yyVWVGcgi5Z45KeBKhHqU7c0EZhusaIHFZwQTEUyVoMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
	b=IEcVkkAH5DR7LRuMFSrP+jHK1SlE9+V+18WJyqbj/klK1Sd4odKhs7Cp/B5m5hBlf7TY
	 l5yAq7aEhpDte/yIPT4kbBaPaCP9hmfpnNF9sl6ATuKvAWxLCQ3MB5c++MTlDSy3uvg9K
	 DDGFiJkMrxOn9Z428B5HLA/8NCmtgd8/IuqffXZ0aH99IO8Hji+eJu+rWKHx29LUYHyzk
	 +JD/mq/KEdlvA2eJzo1acjBlm4fjbqcLVcIKymf//QgdkIMh9SW3zmzgPZlXQe3Re9laz
	 cCVA3ragKVgjDYtjXh22cLat8apBYqviLkI1xeO5cgW4r4rvf93PXY55WjXhdlzi+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEWT2yoT;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE0606A325
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEWT2yoT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso35061135e9.2
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=bEWT2yoT5Tqb3VfDTgYbStYkXTAMXcyZzB/u6DXpgKRRZxarioIIaRXFCxr2OCqdko
         v5EWS2cudqMID6JNlkhBExVD2ALhuELuwUmROP5z9rduBLffRVv2TsGBbhBv4h3R817g
         zVCGvBwblN1MYtjDYuMjq+K9Jx7+zJZe+uA8YBfJ6du/RDO9IlztztB48jR8xC2/Sm7C
         gCeYkM9Nb6WjkA5JLgc/5M3l0jyJYFxruibzv89oZ/yeokpEFJTlgJOxUqCXXvWQ7qUd
         hZKl8Z1OhWMoRkWnncmCyPSTmlN4up4HxEUrTRb96PSFw8rrv8XyYwwPi80WrRGSIEPH
         rqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=TdqHDmKoTjIQY0QcK91E0RLvDrNYmNHVVUDtPLFFy1fIvRh5FHJJJ+9PgdR4NhZQSf
         jSh9vydsy8EgODUk0P6dIBP8neMVJIDt5yZgOaGkM8konnNpfPygnOSbSNgXtf6v7ZvA
         /J/fzMOwmPObL/unulTCBsDKX0Kj88fppLVND5yTHHKXALYUE46CFh1HDprLUzUyvgfn
         qELNgN1A7VuDMOOxyJ6OT7HfhLTuRkfhODHSL1g55dpbviQMkD/7cayxDFUVKx7YUEyz
         iCZPP00BwMmKEk8bHPuArVqC1gncWut1AelXtvPfNKoPZIplRyMOMbUQk4PWWRFFEPa+
         ELcg==
X-Forwarded-Encrypted: i=1; AKwUvBwu+RCodMTgkyMRRk6Z2UZvjkilnInXcCbSE4Rv3IIK3b6mveuzWNPYumvWNVMhG9SOtqY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRGk6bxlHkfubBDdNhu9SMLnmJEwPdxUTtezq0fu15A2XdpnQA
	QNI3uCDQRUqnc4k4UIhFglldYHHAZ5KFb42LH2A9yBp20iOqEkqyGzxQ
X-Gm-Gg: AYBFou3XaUE3Ad58tcW4m5VFg0CW/qy8SfXEQLllMn7d3naFEVBSwToSu0/n9LCtoK1
	5lhbDez+xWvzzF5cZxG2kkkYW8/9JzJG2cWgI1fh0ExiSehbyyGFDNXAGqUW9NXCY+njSwNgadF
	v+dseAPB0aKLtrgMww7ZOJJcdP2DfflExsc1YPKhykLlJTMIN+tQVqAjcMRTFMpiIUE301n2R0V
	oizySa6MGhHV+EoG8xBNnqZfcCZeJXGdHTKqMBi3ry1MAt8j/P1yCfaOyQ3PQwufP5qxCkngiaY
	kympFzIZzQKSxlnEbFHmdLT9SDh4nt8ueoIq5s0SdeOHJCxQDPiPhLftnb3U1BaYRnp5QKpUD9k
	lJJGkZn3SwFqUhK0XaQmw0BfS7+WYDz4y7X8jVUM1F+qbTKir6pXeLcOYFzT4wlTp5cxdLbj0lr
	eFZvh1mWf5Pvv1Z6cSqp6KivXmUkCHdaSMMLNxa/GfVaE6KZBoB9o/R28/vsEoh9soOw==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
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
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
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
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
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

