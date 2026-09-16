Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB16328B75
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 04:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532133; cv=none; b=suDFCH1KwLYC9irqgclJQEuAvx+Hn91f21n90JCItkOtiQKt5xvlxMQGWmYspGDYYlb6JvEbI2unGb4Eh2dmEomBqH+L5i7t1lg1SkMdt6FY0+pdUKfujA/NMpIUSQm0L3hf9ImWhejBjFR5KAPM8XE/bYUBshPgbJqQVVshLdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532133; c=relaxed/simple;
	bh=pmiqpg+YqOsk+EKifCpoFFAOwMNO4lcDpbG+a0tTy6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7TbRhi3X9RGSDPp+ZQpStoYw/tvtS3gOdDfhfno7DRzt5eLXio48jpRhvnd3+gDtFK+edJPStqvJISvuXO0jFFTrrpXGOJozuTwuReKuQ1FfEaiazKPalgC8MCVVdOlOV+I94YIrkMXnpfFdG3i7kFAF7O61uEJ+oKIxYXN49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLOLmSX9; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLOLmSX9"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-804795653f9so905278a34.0
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532131; x=1790136931; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhwjcBFP/KKm35RjYsTK0NhciT0e3mhgRUR8OdcQ0MU=;
        b=hLOLmSX9dBttj9BibcRhsYX5xfVzZvILJWs8bqe80G1V/iq2kwsP+J4+0OcSUc33KM
         TvdalsU1PAFqdJHBbJN8PpXPAwupKLNhXbo5m922ze7VAFKOwWTJrv4+Vd1z4lgYjBh4
         D2HLFBXw/kQrygxvNsiY11/9zRSb2wExpjt3h6h1lpuGQIbLJdZWK3NxiTfRoSPaAmDR
         qrP0MsLtBgKO28Cs/hxX9COQA5FSNBirXbuEHcHtiRMerCeLeZmSRrUa4TnDJOn6/FjM
         nBCRBC0e01s+K55aJIsRSknj126F8n8bxaNO2Yb3ufJryldFSDAuoQlDVxGyxKNwLxnh
         ODgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532131; x=1790136931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhwjcBFP/KKm35RjYsTK0NhciT0e3mhgRUR8OdcQ0MU=;
        b=DWvLOTbMWntO0dsDvkVHSTPX+po+u7SKgDwakbQxiD7F6r08/abgmoGopIL7+WQShD
         fGU7HgRrz5NDeKvVOkWMMwGw5BZwOi3tMUZ/onB/IthJ1ePXutVkQUFE8OKUxvi0vluv
         4vqpniV6JVCEgHKMlIyTEMcjqtjA8oK8oyJM14o1lUaYuSwIRuOy9f2Q24KXUNOckzd5
         rfg3C4T8Kt+Z4a2O2OPGDVZTkpUo7f8CMrtMdQ+JGU2KrqTBshrN5gKH88RxLIZKbxXT
         kdY9YDrwjO+wUEU9qos/6q8fXI05Hfml0fOT3DVgMV74WoedmXA6mw0H0hTRZntrFBew
         oGKA==
X-Forwarded-Encrypted: i=1; AKwUvBwmZDioqXs3e489Db4+7YnGINOoDVLPq79Ynvsv+/GXM7wuxcOd+RNXMgjtxBpF9lFuf68=@lists.linux.dev
X-Gm-Message-State: AFuF++nwzZTOwlIvfZMe0+jZuMeVOWcYxKXm9IbmYdsr6My3LhMlcU0+
	GM3PserV44pT257fN533KaOtvd0wDfacl1wVa+fO4WxNuomhT6QPvJMI
X-Gm-Gg: AYBFou1gFsB0obc9c0jZpobjS+504QN99x3NI72gbXSGL0S2+DxqOZHARo6Kblk1WbK
	GiHlRnMwlJ8csHDCpsg4CSQQ9dAoP5hrFTpI8y/xMb8CzjJWDA/EtgbvVYz6a22ryPQAZJWN8gi
	J/OUouAVliz/DCqzwh6+m4jpTRObGoOB0eAgxhwm8nK+rcyj8vNCKRB4gvXDOTAAZT1/Xa+RR+w
	JW47rBJmVb814OKVyfI8P+04OKDbdp93c0dlOwL8QE3dEcps5+hra6kF3NZzeZL/1D2iw0GknX0
	lVkn+q8bYUYD7hNs5wzcVD13oGyWS/EJz8xSJK6eqKwklyifLHfXJf1kT14qG3uoEDRDBKGd5R3
	D91cvTr1eWn2m8pP6NnRXFHpw9vkFXadnK35QjxKoREGW/IUpt9pIysP264OLYQ4YC+cUsjkcNQ
	/f64b+HUZJXOsxeWlquKy3FEFMlTgnBonrop0fyQ+XfXgxXnLae/9qFjsMs4148h3UQ6M=
X-Received: by 2002:a05:6830:6211:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-80b2f7c830fmr1398025a34.28.1789532130742;
        Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:26 -0500
Subject: [PATCH 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-1-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=2042;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=pmiqpg+YqOsk+EKifCpoFFAOwMNO4lcDpbG+a0tTy6k=;
 b=zlRbINoqD2290MGLwe+MTrL1s4Bsp9ASTtTw5dB1r5/3VSi6a+YNhJDWnfn5xx5DMFAkDSpsR
 JKyOG0N88gfCa+Au6JKO0cUBK36yIriOBv3MjrXPSU5E4mjHwOdwFy9
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
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 2 files changed, 10 insertions(+)

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

