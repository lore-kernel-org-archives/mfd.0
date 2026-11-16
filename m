Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864441;
	b=NOMWzGQEpybZ+aE8OYLKdRFAkxvLZ1SDqYy71fvBo8J6B6WQyt50c3YyWWIgm2klYqCA
	 D1G+3mQI0C1Dl1usxnBqVRKtFfGY2SOSnoxdKQYrNqoIFDQFN1L3LnTloK8diSoyn1js4
	 jSrI+tpMdqTakvhqYu8ORQKxi31940fP334Zo20n4TRLq9sez6nw32DsKURDkZYSsfLJ2
	 n88aBfbVhwzp8hElTOF8LsZMxkLQ7jtFQKMGUZO70GBy7mdaf1w1fN6MO7MPaqMh3ezso
	 wv9vjktUvHzLaVWf0HVc6TeKtg185YWLbSLbyUR2QaWmb5gF8F+gOXozGBRq3Vfcusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=pFV5qHYszDhN8CwhD/GgdYnSrAlacEF1LKF+eb0ZlffoCOuUGCzMx9RML6r9qw03JJZJ
	 zrsYWCpxwtQuuD5Nzq0TaaItOuupdSS17uqOPTdC5CbIBL0MlVdqhvWSCa7jfkH3uxH/q
	 JrcM6iClnsGYaZfnQlXbxoYcraF+lxpeDUvUOT49bcmH2FE9UoLRGqO0KH6O1nW9wdNRt
	 fjz7549A3J5EEpHAq0ycU74hrcSf0J7OYZ9/gVFDGyPZw9LAP3cqaKzl/YgyM5fLB8mDq
	 5ErvdUQSooCO+vqBbOa5ALPVsu3p9EXkzSYG2B9h1zRTcGJjXvstgQpERlhhVoGMkzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulfunO6S;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7251606A32A
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7251606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulfunO6S
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22763135e9.2
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864439; x=1795469239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=ulfunO6SoQNiSEA/+MU6dZfsBsbTjXbHSTQc+srGKsNzRvVM86xWxD7nR8FAEmCurl
         w/j2NcdRyDXQ0QUuLnqlvPs9doQbTZB0OhGchoWCmAyiw4BunBBGTNB4CRyKbab7FLBl
         LZhh0NJYyzxRZPbk1CXLs0c5XeLg7SK7UCEtpuNpQ+ccLLKPxhpIb13odOGZdfrEVZqu
         Srd8zbP726v0nFVvQdmWp1CUMh0RdvEeBL3bJXvJcX956QeIRYb3ciriM7VJ9iPNWd6R
         t7Gkb8DnpSfBaWVjK6aFqSsOkAqiuW135sm6cWt9cHXeqS+NKd6dr9N6u0usnEUPCgwq
         Vr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864439; x=1795469239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=ZVow+s1NGPvfqremXpSIuOq6ZcP7IgXKfgCth3pSyHZOZpxSSh+WeYkxNFX06bH3q1
         kS/pUbm5GaruFp+eYvPcYbBf5r64exyx6EjRRMnWCJME0DQvr61RIR76HL352dieQqNI
         8KXMG1Djc3trvjRigXO85pS98y8OZ17Fv0bltpi1ycpz+eNFKb+zZTqOrIKx9URCufk/
         2+MYyQr2NYCUQa+agg5ZNlsq1nbNTZjeOJYDPFJUeWv8+nwP3G27aB3HsYJTzCaA60gN
         TMiAsx1T66GNYsZftnEaB/iSEWqfOo1WnaNNX53RNxQ+HNMq7ePx1Dvdd9ocOK28GNqN
         yfRw==
X-Forwarded-Encrypted: i=1; AL+hErFzrxvCPqE8T1LM2VtohRNv0B/6Gi+Nc2gj2Dcw9NZV/O/wb+GvhjkWQGKBaRS1ogoidoE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/4gPbiEEC2jVNL5xYcyVck5grwCQojMDSKb2omBofk4jFFexmB
	w0PknIwFyAo7zF4hzIKIEnq50Gj6h+zmdwZanBFVPdV54SpV/iYppmiv
X-Gm-Gg: AYBFou1nbMqYax8hxQ5SielYqdBCzPLnPeB2r04fFW4bvxw7Jd/G1VXgoWuWN36Pl1q
	UdZzjrWng5q9tlI0OggD5KJHqUxHNrBTYvyQBR8T0Ksi3UtnOxlGGX0DwdDRcUYui1Rg8J8A+wf
	0i6uXmqHwYIavbkf4Bk9a1/Unr69bt8P1ViqyLMcAi3Aeub6sfbnmEmQUJf2lijnyWdr2UWZUFS
	OX4rMPyB+Li3nYdvJ/ZMDUHWmVquWOUpxvJ5kM0fX+/HQ2E6GKbiq4vUjApb61gawTR7P0iuj5e
	Xq+U5s1rrEBOY6tBBWDXzTxb1x1dKvAufMW7NacrR6PG+XWYvtlXC9TejYpFgMOdnQ0H+C8MmcL
	IUHY+c3d53wejs20Ke6UQspLqRtqmO5XChRiJzuPXhcC7O8Gnj6uPEK6SO43GjnwoTKBE0HbIpl
	ah6QOucnLl7Tqz6U0WPI1lRmLxABBjqdBVfNjsg5KxSTKMCZ6hVvTWBO6iNKjw1k/K61cjs1Lws
	dmxIxM5t9sbr9UBvgWJXlzOj1TAU3FQIKKwi6S+VNCthLhuAf/oY+xOX9GALSN9t84bYZjUL4Z4
	HOdKSWcCaKgBA6/YmPBpYpc9CNh/dxAQ2bG9u6Ot
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr255653315e9.13.1794864439353;
        Mon, 16 Nov 2026 13:27:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:23 +0000
Subject: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=JAnPagjMpge0X10XiR/LbxFcl9vIwvXlY8rdMR3b7TnG2zjS5Ef/3pOUFBSYZcopY2HJ+t+/s
 qtEtnXV/IW3BvhWLgk5yEo8YJikc5cpwNQrDqesXNsRHoPh2k6l5Th3
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

