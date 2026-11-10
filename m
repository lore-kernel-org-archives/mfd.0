Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320434;
	b=j8syIe2xMl67fgUXWbtr2XBvV/esj9aSOb/+jcnhP2INsQpG2J1XwhVMCtyH9kS9gZiE
	 DUunUffFK+5OnohSu0To52tZTOA4m5IBQG8p/5BmXA8/KqBDYEhwyvhTcgNu5g4HDW/f8
	 6HiMUODO2HEa2DEMFO8Q23GZIXuJtVV6ZF0UpwOw4RZIYFn4yICF2uK9hPNsE/YycyXv6
	 iqMKmdt74v+BIcxNp/hZ490XkhL+zF0lqf0P0c9qxZmgOrHxIGzAIoXoi3yYFupzkjB6t
	 tLkMXsHbouRPZewipeykPKyJu+0LzH+koO/Mq39izHsYvTq/h7rOuj7jWmr7ToPg8hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
	b=pHpb3bB3voaHodov/Is36Zo4+adMq4Lv3mdlBLwcrPUr6GiN7qiXa3M7znUc7tfZVLSq
	 K5Pm0d9EQY3BtK0ZhGYwYpXps/Q8CKO9pH8otV84gvcF1/1j+uIuDzS6uWhRw0sJDGLDZ
	 U43GwukjP4X/56Fsv694Y019JmRDWHVoFzf11Y6pQd6OhlW2IJUv/H42eXegcjoNt73Ls
	 xHbuUrikIXVpevWOLd0qV3dRhq7WZAC0Slu0iIRlH+q0cc4cH2TGUS3ZSPEvEGehCCsLc
	 gBtVW0W5zm8ArtjJiAma8zQmtvW6YA2x0U58SHwz0yuNMZRZTLfd1moU5qAU64HeZqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4MQQpab;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B808606A32E
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 14:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B808606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4MQQpab
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b349d21fd1so15316647b3.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 06:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320433; x=1794925233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=b4MQQpabUKKdGQXLDA7uzDi1TYVdR7fE8sefQ13yq6p0bh7dx7HPIkfwpmQaMUTFXS
         /rDtPFWgWxvoPocs62TD4zVUB1wW2uDOGnViz8VG19XsSI2MtgyJJwHoSw8PKSGHGRGv
         Cb+0VJD7kwgoEp5ZefrXOQX6aG8Ttnm62fRxt4CEFH3oP1pvjNoFC+k/edFucactK1o7
         aYKle+ODlO2roaDkH9haNO5pszdEdM52n2erYqh95JEoZP/Qtmk0ZSzBel3hVfkKlE+W
         owv0WfI+KMk19hSE25eJBRiuJvdwAPMWwvX4jGeVSL5Ti+uZaPKVGY6DOs7VJHQeJZdj
         JhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320433; x=1794925233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=DjZXAJ4QTDbwE3dcphTQvEwuOG1yiWP9HRG6caWo8OZsxFBFx8FkpbCyz8rRuPMmd3
         HoF2XiNLBsV/LYbnjIG0/lK4lH9ZSFSTFHukJSBkIX17fFDW2NgTp77wMUC+F60ZweXq
         EOs7krcEBmDP+4jgMQz5lKYc2pxktYpzFO4l+Cy4In4hAu0m9gsekVrJc6bB5gjnbdNz
         pyXBRJH/rbUPmyblM0ScITqOxV0CzIMyxzGtMgHBTWHoIhZiQeS55rEAxQvaYaYrjIDe
         5tZEUZAbDFc+2Ob9wweetUtzQee+KQshz6beK9Pk8jKdqpkaC0A/RI+hUbT6f8dVwueL
         xQXw==
X-Forwarded-Encrypted: i=1; AL+hErH8dY50RhtHphDq9iJAbRCXNqW3NFbJnkSQ+Bz46T8NLbFZnfpoLIwqloeY7U3OuutjqVY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9PZnRcU6FRvvxEab18fqIIOfnrxggwvB2JybbUEwEAicIt4eBY
	KAoZL8NTzWaioS7ZJcc7lqYGrlgntHcIiOVd3PsqRd/OuZzErw6rm0ft
X-Gm-Gg: AYBFou3T/A+H1RK4xRVVk1yDqWeraEsplfTJXW52aqszNjYxmRsYt9184vEWcMikuRt
	vzoVwluT38fTwylRuOMQPMGdehjxhAdEI3geD04CdT2zUJMOP0b3eB5XQ2q3qk1lWfzFbIw8p6Y
	yOZATLzCEo7NLFfQvAULPKIULn/xOc6zrPggJp+msocMLoZPzuulOrCz7rkFro1YYOxU2BstAyh
	wDpDB9aCvzfDG+5zICJJWZsDEsG0ZFmAnecw7MGSxft94DJLZo0KiPrnmpWvgKjDSezgMwHncQO
	TN8dzYkXOxCgbpNUa8xba3CHYO7xNXQlbpNU+lc2iY5ZDeEBWN1wuPDMkoZb+OwMMg5HeJX9nu+
	QLklBYpWetbhlk05YiYC4CvblmUjELajwkuZmxsZZOv+BJU+9m5nFAGkQ0TRTq+zhZsaZpdF/0M
	xKgukQYDP4akDzecRcsUmismQ3rCPh1UGdfzaG04zArAmJjBRpUlpKBwVVFJsSLsk+gqxjUx2k9
	kH7RlX8tMj0wy+e3riN4esB7UF9Jpmeg7EPJXJFZYheeN50kgny98bLVCeXmN4cV8ObWuhFVn6v
	urp5LyZ/QZEPL2a6ieoag9hqZUU6tPCAmAdgGj9kMNO1eCzt2VHVXbqavj+vLXtc3y1DvpizOrj
	zm1atbR1J6HSI0Q7LrchbRFU=
X-Received: by 2002:a05:690c:c4e5:b0:8b0:4f12:d28a with SMTP id 00721157ae682-8b392c0b62dmr12596647b3.65.1794320432935;
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:b7f6:2185:e89b:b285:6098])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a229csm1863712d50.5.2026.11.10.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
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
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Tue, 10 Nov 2026 11:19:33 -0300
Message-ID: <20261110141934.42490-1-festevam@gmail.com>
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
detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
lists these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Newly introduced.

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

