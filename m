Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44EA3C8C55
	for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882325; cv=none; b=f617mQN4VD5WhV0CrhMmOr3DkGLDGx6JYBS57ZF7jn/0j1GPJCdS1D/QruOhDqioZd8clVLMNhS4NNRXYMabctyaqSHsJiBYrqMVj2O8fQG1SYIWF4wWfnTno587TNIMZMXenQmv5/eXaA7ht/DeodcfaWYabSQzDGPOr9IoAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882325; c=relaxed/simple;
	bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXI2QmzwTD0OI0F11kMCpxf/aX3Bvl/Rzo/dbbVmvN6ffFeNxOcZJ3zdqIyErnD8R9IKMZSHn2Bgm9UNHTXIRIyg3tdmNxqswC8rrH4PbnxW4cvd5zCaSIbwk2GFnDhwruLWdtHV4poJwkcglkCULcTIxhkmcdvGeNxzW/gEirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmlpHrHr; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmlpHrHr"
Received: by mail-oi2-f5.google.com with SMTP id 46e09a7af769-7f4e2118db8so881847a34.1
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882321; x=1790487121; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=UmlpHrHr/HZQiQYwL3k64S6Ry9YMU0tUFcGkpbDQp2NUzgJ+3ofnEQB16kRwGdd11a
         9D7G1TRND0k3EkXfVpfnST7hsvfJLlS5K2ouOTvOuzN9q8tyvXcpoasmrfytboJ6r9oJ
         kMHDBepoDPrsRFR5682ZhJA8Zbi6UNvAYTk1T7c6iXGJl2ol+v1i2STDOx+gE9mohVaI
         wcEPwF7u/i0XZTAakZKBMGIKdEsqfBJpqSLabbSRS5Dow3nB9q2G8pMaOMJm9SftGk6X
         4hIFsOjDgcbF7KvFJxQtpqKaC8M67LW9VTA6VlTACry5KiNVJNo1wu1+uEhuiCxOSifD
         35Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882321; x=1790487121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=ngBEhzOa66/qjqzeBNjgz5StT4JhxWSm30DNavSXCppky3LRFVU3wQ36zthapmdJc+
         czWZ5+ZBvLm0HxOa8yfwBXPGPPjj0DmBnrxQcwbsGKGtjM1m+8sZOcgWGtn/pHoPh3C6
         K/+89wZaiRdkvIr1SmSyYEuo6PQblw8AZZJv72v3ywHcrPqpFS/0eJIFhMqYDJkXC+9/
         dMUHE3H4WSW4bBCB37r1yIpVFx1V3JLj/B9azVBfh38SavUKncmIXLRLEG3TLPmxDEmf
         wt1NbMJptfn82mbOs6+iwfFX5/i5rz6ychJ8HZ7NCRfCJYwdGqHsDB1M0nWaEd3K1sw9
         RxWA==
X-Forwarded-Encrypted: i=1; AKwUvBynO0QqZ92yJxVTlxPlKnF9QCpHSZqtKPq2msBemhr1G2MFE6Y24lLN4/R1JBTyuXTdc2Y=@lists.linux.dev
X-Gm-Message-State: AFuF++lMG5xiO/rZM7iCnAqO5D5SAiGkXi21niEeKDAEpVhBwaazXrpv
	RAhwRuxqssmeBM6rz71WuD+g9omH4SfGPPXDqf3ksYiBfbI4bPJl6d2szoharbz/sKE=
X-Gm-Gg: AYBFou0Jdc/C/punGE7E1pLmDFVZNBQVh5u84zdrDNe/6qTpVgSdFhxx3r7O+Sw0QdC
	F+l8VNJcLwZcRSbYAuXQlMN01noNzfQW6F24cnWNot4YC06AXIAaM8G4ovChbGTKG09pJjS5q4Y
	UULMbqUFD0CQYuW//NeJeDQ0SJifh23oPytFpyXBunXYQi4JiDML7UBnm3JdGLcV7/2Q/1rTK6/
	EY6ExoobM8SDNXqNIouOjI82UMnoS7WvmVLZnbbrfiH/W7ifvAD1OL+YPiUyE3PQ6NX1sWzMUcS
	g5nSrjDgztc6yOV2tc3luqePWpcXrTBzGOyp8733kVhVEg13WX9oLLNXmIk/aGgYQhFjkAm5tPT
	LlqjqQpE86DuvonK6OF5R5DAT7Bq1kmiRI7laQRWzeQVoMBHa+7EjOuXUhP37sAXo1vT+FAf6dJ
	xAhXmUYkZYkfkOLPjetWHXJ0cl8QgvpzBfdb/wl/BElAsnuGVPMJ8IQ2pqZ//TQRrWtVI=
X-Received: by 2002:a05:6820:c0cf:10b0:6cd:3fdc:6009 with SMTP id 006d021491bc7-6cd3fdc6073mr2569288eaf.90.1789882321459;
        Sat, 19 Sep 2026 22:32:01 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:00 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:51 -0500
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=Opl97KH8MrqT3zIoiO069ry22IpQqYaPkHHieyAt0MVeeRXmAV1cUFOzXcG3h4gqUISqz8ECP
 zcigdUcPK5ID5aT4XknZj1qigND/X/OZwurcQvc1nDaYdP5H9wRI4Y3
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
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
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

