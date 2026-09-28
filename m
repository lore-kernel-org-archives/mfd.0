Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C74F85C2
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629051; cv=none; b=nmTS8s99tb851cfzMrllQxiw9A5btHs3x3TApFGM21YhCgL8r5lxEz5DGeBvMBuep6LT7glYZ8IIrEkq/J3W+swRhDx6/VQIkl/WVd+a4a0Lz4vtdyNhzQ0keWaD0i7R2vUXvuqjd2wdMvFrnRf7exb/OLrSmtfof4IQO8j9ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629051; c=relaxed/simple;
	bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgvynhCJorb6t7tdKbaoiI+HbsNOg1KXgTLBLIAwrpZsQjf0KrAuNmib9FHRmO1XRhTFADPkEWDu7SNNmlDRcOd/2NCWedYcRTfWgmqZCNm2BVISbRlwbcC9JZZZ+/ynOmBwnjoZSpO5wRE3SDYwQcyhHCwfkdou9NVOjYG0yGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn4PNpCT; arc=none smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn4PNpCT"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-53338682233so5723171cf.1
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629048; x=1791233848; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=Kn4PNpCT+MoxgoFQF9UE72KsqKmD2pXRzj6ODc835aIvo1W+UvbgmvffrME7SgAX/p
         Nl5xbnFkT+ucJCtXHllc8aeaQI4FxJNe0+hu06YMME6jx7Sx01bwUMenEyF5kND9puV1
         n5yO3Eqqf6S2XUW5HC2h89e8OTeZV9EPydidtv1F9QjmnlB1ISpCG2d1CbYXIq5jTdZR
         rB0sz5za9MR0UeTiqMzkMWay17ZYR2wmw+lv12PgHoroXg1Vhaef07WLWOLW/fDrF7pp
         hEPltZJvthG6b1a+yUSi4oNipA8LFHAgWkdm6/qZPLThtzwxpZGHLdaX+StTv2IjbAfp
         h94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629048; x=1791233848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=NraZM8Ol7DipkDpSje9mx9alBZOEqYe2JKtuN2Ux3MJ8C+HQo0tJd5JO2WT/rUbGJu
         69/6jykFnebdid/wLMdcIMA4MTTXZsdSxw+5fxgYjZweM94W3AqfqxwUhP8kHXWkzzwo
         09EAA04Y0HExGGATBLzPnVtpmjGlkCa6O36Fn+hKstkYxqhts+0mPW02bssaHWwtVU6N
         be3R7NXWA5Vf9WIqFgRHWKv3rF+625ZAAVR03mbCxBjceFJsabwtZejW1ZRicUGCw/8n
         7bIa78QvKo8B7mHzsDoIuCiFEXl4+/ZOe2FX4iR28D2SoI5tsH19qKepK3RG48bzeK3B
         Kb0A==
X-Forwarded-Encrypted: i=1; AKwUvBz0VBGZtp8sIPjNXjeIwMcmIgWDuN5qqK9ggbQUw1MyaOzdtpBCVmHiBSDOIPyWncXnBmA=@lists.linux.dev
X-Gm-Message-State: AFuF++mNaQ/qtp6gkbcpYrEkIyw/93/PXGLaz9Ai29QBQ4GVkYYMQU0F
	HfOsXgToVzQ6AsitBBPl+Yix7Jl+YUSD2YevZpCRgx30VVqB+SJRWW2w
X-Gm-Gg: AYBFou18OSebFUa6gieEMh+Z2858rRCxoIPmkTfI6PIxBx1t7RiwyHoaKJs4dwBb9/O
	C68mewpOM2X4Jeg2Lxe8hTdEp4Bjj0ioBjoOVL+A5D7RjvM/vB1inLxtMckwCpJD/xn752ixOk+
	eCflJmA4pM6Rfq3gLf6cYmKk/NJfrdXPCnL7RKn+MTrHQ6vDQoKCBxk/N0qO/JPOd4ABJICqgoc
	YtyNbVfK1UAI0mXu+C9TfAUNQ4tm83Q3NWYXxdUU2T0r1h9dtGcvCJMPWegREeIwpUI9sRin8R2
	+/NfM/cklMAe5LWEKkqu9jHR+Iu2qcTAI3OXhtG5EHt12Yhtp4svxMtnE8QxFOdJX5PEbgWBevM
	9VfGOvVmoi5VepRlSTHFJcc6uqdsxiFvI8Foxf+fNKHbDxAj3KngxF3IYSYZZ8LHeitCjANvZIJ
	ybG0Y2x6ElgmUdKo9kjQ1wLh+b72CB6ddW9/3QZ9RMtiCbhXlWMPoJqeh9xt3xGqEt5DMPNxRS+
	zfOM0uY5WBMJ3t0AUGmRWgLQO5QW+2pUn4W8+Z50clRov5LcEC4MoCF8TnLjePO/+Oy8M0XjhA=
X-Received: by 2002:a05:622a:258d:b0:533:2daf:c0bc with SMTP id d75a77b69052e-53357e0f58bmr10788381cf.0.1790629048636;
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:19 -0500
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=2834;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
 b=mway+9YBw+26uBdu0PB7mYGQXaUGyQC3x7jQ8ufOCuQmaNxG0dcH0uwuFpe/vq3Gqb4sxO1sb
 8lrBzk4tK1SA9ZB6wmkNkdeNoWX2sQSqFh2yshcMGc2zdcb1kWiQ+rA
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..c8cef3bcb7de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16715,6 +16715,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0

