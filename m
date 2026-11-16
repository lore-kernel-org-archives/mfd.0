Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869294;
	b=n5VGmT8V6akp/58vS1B4wxU+3J2pZ2oNiGNTye9iuZHQ0+tjcxRELVfnic2QusHqDFdH
	 zk1vcPFXoIFA+jJ7rg5uALt8/5HhB/QrksjD8SuAFNTBWSW1hSXBF1kiE1+ZiEcZNWJyX
	 Vdm+z1QDLQi8la/WHmYJHmdPt9LbKJpV1AzF9hQuMVs+gpR44uDvk6O9ltWjWSudJpHAN
	 gfexWG9pfz9ZQ/9RYNQuj7VU2Dg2NJMeIzst8H8nx1a6FVksQcLXKhz9hPfyFBvjQlZcd
	 OsiM4N+Km9aqWNXxUF/ZDBoN2oDIv60YIyTbCHKF57+8sOeA/9C5WsXdaHx/kzzXjOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
	b=lJt3s9IgRngcSPkSYr25mK9StkXk9WIXX0GjNFdwX0MEbOKwHwRrwLFjluglu7PEEq1o
	 7O7AnUYQewtCDjblvmOK2tA7ZElLDfY0dL3HDW7EVhy6YEJUgayARw58UFamopUWwG63a
	 E2b/6KpBrZsvdRefQZbh3qdmnwaw2yMOiYxJyQe8KkM+39m63CaRiOBXa8JlUq5kCv2dq
	 qLg30uyiGuCEuomzlTjqeWfmwvdNQQztU3K0emIWqEjV7phCMocI2H6yK8nZ9h/jo0tCG
	 0WtLtzNOXvT04oYKbT3NlA0CnsxlCOUDUlM5P+g9Bh9GN+mKCIyxanDXDCecRLaVKHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1rM6fo;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2C606A332
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D2C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1rM6fo
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be1e468a8so3109358d50.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 14:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869293; x=1795474093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
        b=Hc1rM6fo6R4X0NWpVKkn+lZ0hxpdEZ74V+rEmCnmfZeH9iPMp0yNLNSh+dXofcBxvb
         iL1wQRSQig3JB95xDk/4/HbjEY5EBmi3Uo1BTkU0GmpJwEwyhh69M+9B4L1Umm/c9d9v
         jVIsbh3GIT15pCF159d3dsjv1IEFmyE2PUubB02hzwLaq8lkvVV7X1eUkKu9xvOK7xSH
         y1NlqB52zDZTvI4ulUsVy8ad8UDTw0OqAoWf9JcUJTwUoZDmnIjq8u07HrsXLwJqjW5z
         EyfA/DwbazNPlbN4IZmK/NqEEtB+tfZTe5lJRa27syFPM+cLSvaQIUv39i/GlhnMs93+
         Asxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869293; x=1795474093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
        b=LSO+u3DG2bEl2FqXkY3GYJf/2CBT4vE57j25PajA+zCvqPcFz2tjH+bpTmrnoboTYu
         OVn/NP342/YXorlwMdbuBApqwmenqoCDOPPZ6pdQG2jF7A/mHM+D4WUq9SPOhICmKo49
         2QDvY6C5TuGZFxqbvoPTqG9rACjaS0Ec6pIPnIL9gtlQOTXT0NVgw3DYYwYakt9t64rc
         IwF4YlKbgyZyYSaFoQhIgEq9jmEqwcCyuB6AdC3TMbwT1opd1k6ZoDFoKE9C7kTuxABU
         hy+03V0rekcukaTC4vVYdCGv8kVfJ1dbDniOrf2+YpalHLIwXaFMZL9M1OeFZeCxAQ+g
         zZuw==
X-Forwarded-Encrypted: i=1; AL+hErHcTyZBOjzA5IGxKnBDlfido2YavoYIYbuD7pGo2zbcdy8mn75BSdePeyEeUYIr80QZfB0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vj5gJty24XWY0ixnbOMAx5zx4d0olBk+rROlvFPCY0CQy7v1M
	2XYIYUNOFCKO3EGSCVYexuDwVJdXt/KfyVobhg2tUVcQUxzadXNXxEUV
X-Gm-Gg: AZFdTZcPFbczPUS67r7KmK3GVpQ4dpCEFA1guLYhIHlKMdyk5v9AwFoNDOyshgWiZ2Q
	7T3RKcQze0U4ZX0+RmYDghTEAr3R/nT0ToiPKCOTkhV9Iyo1piAqttVNiNqBWzrKr3TUiR2dKTI
	AejtHe2wsAgOdo8uKL7oqYqBP0pdusGztpO6VEnzG6o+MF69g1vFmdu4Y4FrMmgQnX3MwnQ6TjS
	oAHg6HKxv7F8th/X58Qe93dltIUvebfA5QHmGCxBLUtgyyaei+POypwZEyNPoMk6NmdF7XEhdq5
	x+56JxEqUK8oA7Wl9z19u+j7tAV+nprfx26Ti9KeJEVinOOmmVCT2yWDSwv0D2nMILplr7TvI/M
	3tV2ytMhbUT21UsIzqvqP1Ciu6UKuqMuPaU1qvQQQyeVCnkjg00y4sm1BbDe6Z6FSDi9v7QUInf
	rcg9dhLPA3Bth9W+7n0RBSPykeIF2d4ON14LlwklL2e0rehUATbJPQRJoJw5fgIA5T7BDTJGyZ4
	PM2ecTMvYYqZu2IGiROxUm4u4tmw9Si3DWqKgpaI03zol4ZlJ5NHs76eTbc2RO2Yzzjg2y4BbXZ
	gRKWoWGztUlz3VG1uWW5bO/WI9rC0u/KLBJQPTsy9JxSBZaTTgRzGpDMRkHAyunV1bSQUQx2Xpr
	b3fyy7iXi+0XXrrtYk8xscIA=
X-Received: by 2002:a05:690e:4191:b0:677:cf4d:a932 with SMTP id 956f58d0204a3-67d896cf4b2mr5729807d50.63.1794869293001;
        Mon, 16 Nov 2026 14:48:13 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:12 -0800 (PST)
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
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Mon, 16 Nov 2026 19:48:00 -0300
Message-ID: <20261116224803.61154-1-festevam@gmail.com>
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
Changes since v3:
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

