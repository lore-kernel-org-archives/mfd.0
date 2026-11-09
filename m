Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184415;
	b=Wa7/E/L2n79HkKTQafCpwD1hXufWJ44CiqbBhQzzYltVRHCCRsVhpr2dYNXChiCup1Aw
	 2s0V7z4wZTOudnIHXU6FYm1GkFlzM4fKYjPsOkHfaOlYVy8xWx3OKGIk+k5VQKCdOT3Q1
	 5eGp0p4262usxbKsZEGU4a1rGpJpVPGaSypPXgyZ9wiZLBqrAtxqbeAWmZXRBCl5EtZ/i
	 AAGKvICF7okBkkSviyz1ABoMtBXKqRKdvfA2ux1QptWoFZGBHJJuVob5cfXFQj0XwmU+m
	 N2ZZGj0BcPLXUNbrFYsTQDYNqoXEQHWLDte7lemopCQVBxdmqnxXwvLVxoqlhIBsTBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
	b=IPIhpfw0cfyfDGwCXN27xkzLKUFnehtlQBw1LC56oiSHR1x2eIfIzSebOVLz4Zf2L7p9
	 Qgg6Ss2geuwhu9dJWEzzQN6YJeFMJQi6+P8Jy2Bx03kLxqgEs9H+PShLoij7t82OW0Uo0
	 mzx9LQdD8Oiiy5MD0GLGecdfVXC7gFU+cXEmcLV6Jr4mmL6KVz8rl4KoSDOUoCPL58jxm
	 jocVS1d7ERxnGVXCrlSNzBVSSMOHz+s2EeIu2ta9CcmYnhWi2O8NV9JPUvwhOcDx9rb2f
	 JTFbmSJ5vqXJ/FO7KSWrMfXnyG7sPu0WDgX+QXR5EbvffHc/iXdWTHP/EHzHdkPPr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtmoCSg2;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B036606A33B
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B036606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtmoCSg2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2792075e9.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184414; x=1794789214; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=wtmoCSg2kF1Qe8H5rB7uGFZ17Dr5NBK/7ignptEqhd1hZqdJUY/oV1+WM1lvLcy6jJ
         t0i93c5a1ZeI+YcmyTQBaZ2PE3tfXUd+7xDNBW3RG07rFHYAMeMuiKDWNX7bJkZRQUGf
         Oe/6815+V82iI+qCm67meILg6y8oAWcptQeTxcDKFBP3DP/zebzjWY4XlhA1XzcbgsLR
         IwS33JhKGI7VVij7ASjSizxqia0jpf2d9FSPW/57W/iS49+zoGQ+05SvTlcfUWEzjGfC
         5QYRfX36A4km1gKtKisyETZ1QXLACOCeEKlwbdNXTBT8hau0C4t24marWBIMPU1se9nx
         FC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184414; x=1794789214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=M4KVyJ15aUsqpNih6w3FawuJxbM1663Bd2KIo3Y5hjU0rJheCmGAeYz9rzmlKQVnbx
         H0TB3HxB/5ntRVzeP5G2q98VtsEU8BQZpqU/oYmM0/7SZ1tqVi8HP/iYv7xQ/CCCs7FZ
         +i7GgpYu3pZrv60b5rMs6+sIalX0waeVSgNLbM7RxnSgYypy3y/8AEr0SUe7pZTsklc9
         UP86Koql9gc9M1tjbaP0J7hoiT+dXj2invyy3MqGvOs4w5vm4V6MlYDvGUcgcsgC4g/i
         DjwgKdVMU3cw97jiFPsJcHKuy9alV341VjkZUHQvV+l+T7w86ezrjkbabHk9Xj0ekmNE
         MbPA==
X-Forwarded-Encrypted: i=1; AL+hErFXAY+1QVTk+82+H+jJzsG2D8KpneG+7Rf3eQigxnhHszOj5KaafxAR9OWvAadTjmZ5JIU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zwub73P1Z3oGx4U9ANWXgm7g/DpLQ5VPFJV6Oolpi3aN5rT+Z
	XuNE/g4PbD6STMETz3DSj8TQ2VGqDz6ir/9XHlcAgbxpewPPWwssDEp5
X-Gm-Gg: AYBFou0lH0TG7DpbUBuHE2v7raHNYzBBX8vQG1Uywg1immP5HyR/Fh2ypIPbvvzHxSm
	Mes8xFLXd2duapHKDHCAwGDNh6b6MGiBu358p6K6WgkepRf2crM1Ta6rNK6g+bCiZ80PWFcXOWE
	3TesebOE4qk1yuh6U9QCkL2BA1d5Gib4CTwq6DKfWbboy6Ms7dHpyijbg+mT2zc3eTsMv2Z+4il
	wlLLj6/pzC21WGNvmivhEj2emLBEG7ZfNclkMXfVscEUH/ApWgOBH6O2lfc1ahKl8m8pQ/eEl8m
	cSjOPtug/5pitd2BfZtMrY1v4B5aL6AqaUKNNiWRMN5vjMIxYCSle8gys7aQjuJRh85bmd+B4Mo
	dx/OalxsbCdwQGLtGhV64hbKgMAwcqopyjdz+s+4VGZ+uFFWXMg+L3p4CUZ9XfZCI62ZClNV63l
	gx2dLNEC5epE5BGJeoAAOeV6IaABpw+dVNJbuR1uCXweZBxcDvIAbTYCnobzpOiF3M5EytvOREh
	rjYzGfywLkyuPIMo2j+Nd3de9uzBHqsPgvnj9WRvPYoJfcXE8Ml0mSyYsciSO9g6jN/df1KjoNt
	is33KXhEoL8RQnM7V0f5L4GArG0cSK0fmkb6V6zw
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr50119595e9.7.1794184413846;
        Sun, 08 Nov 2026 16:33:33 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:32 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:14 +0000
Subject: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document Halliday
 SCM
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1033;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=mntziyVI6wQ2kSkSteAmiaUttlX3LQ+YCHknAe0v+s4=;
 b=6KLs+gQMEgAdwwaI8XXKZHARhr4EIqJqXke9wpzWMnotth4jMEZlLGfBGwMvNoTpcE0tKCN8v
 aRJBBJI0d5iA+Opb629gN3RAQt1TeYIjZdEvW3ChlNmIbJyjVXak7Mn
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

