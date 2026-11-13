Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533542;
	b=iEgGvj2Hnn/RVLdx7s35aAi7E0RjSl4BDQm+RTJVhIt1GSugar2jm9/dkoTzryW8v3F7
	 v8Jg2jLUH/aIHoL6y6j/es+VojEBGCR0I1M7JIBy1IxVvR364j8I7jqi0brr/I3wjCXkO
	 ZmplbIeV2LJIXsC1bQlyspqg7MOecTUp5UaV7IZRTmLhHuhbNZLnG+zeSyVzdUfrFxsHU
	 xQGQ2KCwh6Vqb0O5Q8gf1CC97H35xNP/Gfebn9lOfTXtukraEPMIuEbpGk80xjUc7hQQb
	 ZGMaXr2SZ1yaP5b80giPgasxcXLQBLwbcmEi9zz7PUHZj95ogt0gjFC1oR5Bu1E3XdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
	b=eMpLFPA3F+gCeXgQKHlCyC/JTxFO8II2cod042DNXEpR4nXLlCSvcmKs0bvQd3XdA3aX
	 4OLpZbZ4ZUymbqBP8PNqaRS0JlMaYXIhvS/3SW6JhQ0VRyRgzS9kRMQ8xts1zqcgPVHup
	 XPL25rIuu7FAvPTTeVhdHSXAUMr2ivvsb5+VKBqloqf0S6NquhLkcI0fTRS2haTOtQOPx
	 DgD+hpQuzcUO6/4YJsNvYOvNeTOgKjJK8q/G8LrV6HGDHDOwo2GeHc6lDhSw+IGx8wNJO
	 rBA6pfHvddzBIPHslhkY3DVYgsMiIEr6Xmwb4bN4h5pg1qOAVo4OA34w6FqR31CvRkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HTm/xoqG";
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1D606A323
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 01:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED1D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTm/xoqG
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9908c849564so134883241.3
        for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 17:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533541; x=1795138341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=HTm/xoqGjB2dGsJPkfztnyJ5OTvo9YYNP4N2s5uIS93qvBxWfZr6hGC8NUMOEuc8WS
         0bH0DIz7CD4Lf9ey25GK1b0sYWCYfDyHJqHdpulyhUINndIIg8LAI9qnRenL5guIBQx/
         DX7nHW0s9xn+pBk6kdg2I6DaVahV2n51BK8fPxFlubry2yRBHDfN5tlerLuE4ztLvkHZ
         +MUCkHUxaSH5t1UN2Buz2B6KRebm1kmAMVLQYcq2vbQF0xxDFZKw9XZbzTWsYRQniUbp
         mwxhDxK9dK0AU/rpQRvmZmPrt/E0/m/vTbCDo1Dfxei75ovpQVcPKs980H6zyPkCtqbC
         3+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533541; x=1795138341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=GTDNej9uSlVNIGRmwS/tkZS3y1CieBgSYpKUhdcyRCmAudRZYpitOat5VKH9WUsiBg
         Ehv/jbsh8ASS8xFbakU3kFzZHE9MGuW+fOAsNdMiVGetFsgEny7MDoFOcryCRL+pXgef
         GzeBaJzE5iwNlelj8sVHCkY3RHyMpeJqYjDSCGKYygNF5Drk+HmdH1DT4L5N8O5eIqoI
         bhHxgt3Qx0vZuMeFtD/W+4AiJTMGJZavW+NhhBUyXQHfkLs3lo9pHXRbyvwNyaK5yJxw
         ntda0+TMvPtvGA4/5WVjvzeJ90q0XQS0OrA5df8ZIZfw/9e64gAJf0I27oCG0NmCjyp3
         pUUQ==
X-Forwarded-Encrypted: i=1; AL+hErHcbLXZZIpNnTm4sPY4/of06Qv22kDVITxohs8PR8CBjRsh86ePk3ubMBjCGpG5+pva42Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JEI6THHtWA1fPKYlf+uFJuGIveNvr8Z3gHCOSLUt4sgY5lAfw
	YLtXk6QMU/XjJ32Nu4yCHuHgY9J4KjSo5Vbs5QOc2Metg0vfhARKkiyh
X-Gm-Gg: AYBFou0hP+aFVq61AD9iFgKZ/BpDlLDzD3JDsKUrEDh1SiOI9qL6BShogdZ1Wm/nUzU
	VyduX5ToRd9WY/z94Z2ryLnJtrINz4q+r0OYvsbkqqPrJUSuTF2z4eg+Ej/sBqngk0ZqprQzm1W
	WVcLDH8WVq0s7KZ4aZ7tP9+bEQuugQxCddEmyY/jLWLzJP9s/mma5pPnBgs2rmx13VKoAmkpsL1
	8pXfgpT2V8KtfookOiZynUK9nov6Vn+QmwarDMGxSAJdgR0A4eoRWJdyaLDHqMbk+R2ctgHGun3
	KP6FZp5c8Y/TQOT+0lpU7ECMqqda6eg8mSJGkhXg69MUXjxqDIYsCYPJnzI+3R65V1anVF10hQk
	OANMSgwEG6dpq1MMYUqeJFrmGSM81KHPjsunSEge5p8GxRF5C0XVKX2ttEMua+Zru35D/49Wo+Q
	seG8A96rnNFHA0L4BEgvNz9OP+NSVcvh8tWukHT9wxrD686+OAmrAi4Y7VvAEFIIUbK95BxzlHR
	hTslDvFHlRZd/SY5qI0bFUbJKO6Z5ClWjs+W5DXuVJ1MOvgdSGR50zRY1ZfUk8hRT1pt5ULAgVW
	S1BtnARtoEJfEZOfirGQdNBvDWUxViS8L0sBZHbaAyIt4HTWmqvVMdFBeQ5SW1+Ck6PX4XJArsb
	XGrT0dqfk4KmDmFlw4VY1jA==
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr297767137.25.1794533541329;
        Thu, 12 Nov 2026 17:32:21 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:4b16:e82:1dda:bfc3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64be7e2e9sm796166137.0.2026.11.12.17.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:32:20 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 12 Nov 2026 22:32:11 -0300
Message-ID: <20261113013212.470981-1-festevam@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- None. Only collected Krzysztof's tag.

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

