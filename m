Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095659;
	b=RkjdA1uWwmkxExdE5QETHuoRAY/9KriyShNWooMZh58RSBPUKmbEw9GwulypbE21vfY6
	 ZiZXpjHU7Fp6SR4neKFqu0V2JvxKw8cWB3HzdipDliXa0fKvkHF7KdTq64SWn3MQP8isT
	 YgZCXvmPN1dpK47T6Qs9ZpWcJMa8gUX9gBD7Q3OK/XaIGeyd7VxMWx3/XFUIZ8u828vYs
	 JMDmFVx3L+A0yWf/VzGADywkRB22/x1QY2QUYFpa16fYbv7x60VeCfx+2dm7cIXa8mZ5h
	 QGBzw4ncprzhiGE9qKbjmHqcshz63p2j4e6grEOEjkbKwg3wum90EayuYR9gIAkRobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
	b=2cm8rI0YTpgBkHU6L0NkWRmYfvAfr/dm7SYVCPEGe9o+xhontPwDQ17Jeo9EubxCialP
	 ok5y3sWkJS4ExNrYqblWXUMzbxC/stVMUgRF+Gwv+KkY2nhgJ2ybdmPn4hYQjYq4pCXcA
	 OltTpzXQ9sU52lGeJ8mANm0EccbN0tMcE7cRbGwU7x+yP0Cu1IEt7kLHnCEiYZ9hszElM
	 /1vng+s4yf3wd25ncKxlWWM7l72KfwIQ/gYTQMRk2AMPUUAHfNxyH/CDqLkZ3J2pRRVQd
	 E6oiY6aCHMZbHBh1/QWwm7Ow5+jBZqK52+p4sNu4ODjS91WxwKGSKsOUhX3F3hX+hLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V56804w5;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82476606A335
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82476606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V56804w5
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso770638137.1
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095657; x=1795700457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=V56804w5g+Ym5Sq0PnrkSieo+2rQT6teuTcWXFW88pl/tCYHCLif09qY0BrNkjNWHM
         RJctwIAWpDLecuaoJjQZLc1KfB6sfI6mXlNeptv+DkS9s6y5VWN2WYDD4DPZPZ5BepDJ
         M3TUqVIB/XQ7ElCq7Xrj+o+kQv8Ayf7SmiOTTTWoZZYHrUVA+18DS1hCeGulpTXwMk5d
         vDJF9ewczECubD/3qx47z8x30zDsR/U92mnAlyB3ztCi51XQtJBgRTlClSzNzjlqMJSO
         k5fxfbJS7CleKXDciw3dA+swpnxqWCC13e598Jfs27p9l3ZrU6Fh+CT3js2xNGsLyIq2
         lvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095657; x=1795700457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=bCdx/EXNpN5//26zsj1rrrZWWWKrWjT2Ou3SNFLQjc44hevetpyOy8dCH6nyxex5Gw
         v5msQ0Nr8UHJyhHAkCY/IosQU1ex1HpgH8mj+t57qeZKV2ocFb0n9xcp2jAhKhNRDsEc
         OC6XEk7HcMcxGK49mJ6IaTjw54DGlk3xqfHnno9vm6mhmZ2Sw+KieZ//a3yheN9lcvjb
         p4WH7rj+eHwr5LE9r6tnRgW0aM5KPcXj0mX/cRUIvKjeK9iZgCmMzSCUXUU5amYBduGE
         7rJKpoxDo0bzDJoFEQ++0NhIo/m8byE2f9zK1VDLcMtxU9RUHPytwJCX7xnc4CaZzdLO
         lRoA==
X-Forwarded-Encrypted: i=1; AL+hErGjAnQVqFllT+m00xsxTT9ojtPAp0ZViWCSiZAsQ4f9/RRAtytvHGIatn5NgrxvpXij6Yw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fB1A9tcezEJTwNYBip3090ZwAjyKIUha1xqbH1ZNhv8UA60zN
	e6D/ltUy9a7WcG+cZvrl7rLS2F4kOf453m9o1qE+0CRiCCtMup6EmqtO
X-Gm-Gg: AYBFou3RShZGM+XyOUWkzLX1jQI4vDOyDG3/nIU2m3AFkWC/cvoicf9tvUWJRu6uL8l
	A5Vx5/JouQ+/vnpf/2fUdx76Bu+SSUG/yNP3Bn1dWUUQY2ztSqgdCTjAI4lUOqlShIChtqUPMl4
	7jhsU1iUZO+yEy+wThzXzp1iko2bSnE3WeY9WkUJiZFhkFaUZEoMgdFBaeO46h+Fjxbx2y9DHxk
	F9k/cC2PtmbSxazQb0OuSUBHms7Y2vVpa5wTYySu1F5FNPbtklnZjjavVD7A6hKPCcmWpGDZEBF
	O2ukSnRn5ZgtVfIwGUjVKz0xJXP2fZ5j6e/+YGcmhIacTXXbFK2wwye1jZecMwDO3dPylPM+GtK
	z5jpOUC8zOgmWMNhJdqHfNDVun1Lpm33oE7ZM2XZV56f0feJEjXUg4zbmzJNGmkRLrvArKnnQyB
	dFBgFQRKh0HrjsUYDlju45K16iyjZtlnAuAGFwrv1xdAyfBGoSr48x4quIRibm1sPJMO1GAnn6G
	ME361tR19ZGpSyIv8WZIuOPbWKJWct2am9rc+2IeHEWQJy7Moe8NeSJG4qd6y85uHr4yhDMKfOQ
	8kmhpjVrGtZlZkR8reCw8P4sB2PTJ+joC65T8798beprQhzUF3BeAc5kZCgendjx7GACk4JyKBq
	6QozQe9gr8kSf29fUEZ0=
X-Received: by 2002:a05:6102:578e:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d6db9e66a3mr319517137.25.1795095657332;
        Thu, 19 Nov 2026 05:40:57 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:40:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 19 Nov 2026 10:40:38 -0300
Message-ID: <20261119134041.16611-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. The DTS
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

This change was prepared with assistance from OpenAI Codex, which was
used to compare the binding with the reference manuals, existing DTS,
and driver ordering.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v4:
- None.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

