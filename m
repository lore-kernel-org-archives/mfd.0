Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864452;
	b=I8AsirPBeER25u/akt1zzFjDlhHkV0vywhStBRmA5uS0oH/h06UbZx7NrHntptvcZlvJ
	 fGEAUigVvg+WoPAbZHnxDMnNGS8eLoQmaqdAVv6lXGbjcsGsh9XHmTF4WYco8VjHwdWZS
	 nUsYOCtbDXHTv9OLqV9gfvVWnLsVIbvibkwOcI1uuMm99xxJFWM8Bs0mJ9Mzyn+aFvodS
	 NhfI5TPhovmqHiNgyQfN2aXkyT81TcXKl11t+P5BAW1qRarzoZ0jCIMIXXGexEkhgMoxR
	 cHxAObHndSfwo6DbIWIYVrdXWe1uUjSMJ2K3Suc4xVZaucN4mOF9cXIM+saEA8s1oqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=rH+8VAUpYPSQCdlLfGW+caF+6NXw3caSd/PahhCQq/26IWUvQjvYc1mpIo38rIvOkpvE
	 Hy25uNLO8jr5JbnIYSDQGgTNgCw0DRV67TKKXTdrY8k76GA1lp6d2BoSKftG9D0bvicuZ
	 rOVlmFskZFlaJ5j22OqEanaB0xZUB9MUAWXpS8uvl44n7JIMzABPYTqZ47aL+w4ffFYwV
	 kvumXm9a4KWI5gBO4eBe+waSUUTD35ximEti8rPbJyzRT9GWsM9X/dq291Oia7TU5mkmj
	 uXU6TLeSjCzkAyRFFD+N4H5J1YuY/obJaefcQFxY1cVFuBDwwYkhLoH+Ij4LVNOStHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NTp5ucX;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC408606A336
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC408606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NTp5ucX
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4246217f8f.2
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=0NTp5ucXBhXc9yLfeVPCOzGMoNeE+rPYbrmrY0xSdqAWwbhmwHQg+lm0PGYC9qy70U
         URFRF/KfVUA8RPa3i2M4w2GsZe0y19hiKmN7wy7jko3U5DkNRKPNE/uLv+ajQVcI76YU
         2Hlw25aMN84wHTgCSV+GhTn1a5+Te5AqTk9lfz1oT+DZNY9/u2RGwkzmrh3Bg+0vO7xG
         jfGRHJnp2ky6VxhWRb/k75tO5yFI5ORdRCstCrbhiWpjFeP/4hZfEOebaMg9+35zknNJ
         yWCX8wDHdzo4KPP/pSt0ye6WfSBbQVu1DZVTnfDTW5q63ixmimteojqghWbU/xP/knyM
         AwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=1TcITImSyB+aoPxms1+2cZC3lSZuUqtGqA9wUA1xuWPk2UQSXh9/EMuUYQ0EYZLdJQ
         0ItJkFNuee4cJjMkVhwy/8ZO5E9m01wK6YVmNoPf1Hdx+2qx5Ya8oPqCSoJMsBnrCGBE
         d8DiQxYkKwtBOunlzKzXwx1oc+koqid1q0nNcjPUh9VFVEfOFuJiFjy5hjNAcjOSCDDy
         lGZo0Y4vDmKfTXpT6TxgCmgsX2EfyN3tmdT32up+fGQZoyWpeCmVpFRcN/wJve12ISOm
         jQiaXTOy+WsyWXet1QF86Pct+4vYmMsNc7NTpCF1upv3QTeaQeU0Uz6pwPHopbIuDXgj
         lN3Q==
X-Forwarded-Encrypted: i=1; AL+hErHesli8MDfZMatbcExhUS+fGCUN+xp2+hlofKfUEt9EmzAdiNUqMQGXrY44Su2Iyi63qHs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/aUZHX0ir0o0+rbTStP0yUwbcWW1hLfI7wtZZRdLsWt3ftQ0Mb
	lkPNfZTK6cX7N+g293KAaXXnmqVvInYXQR7OSf4FcQYhf6gG3baxy1t8
X-Gm-Gg: AZFdTZcjcX4TtlN7qW390vpBBcAQzvekeM81/Y6w97whPtIDtrYwKZde9kqIf7sl31p
	A/9okAWMOCUC6EjzPXh3NUJV186E94oA1RTN0wnZYzGRhRSdp+DfsVjDTnU9OU2YzAyv7JcwQte
	1ULIfF/pi3n1hsLA5dMNGknl/xZJQ7yo+G1SozznQUMtTy/6L18rbgNUQBgd/HPOpaJwG3m47c/
	/WCZNHLXfaHq6/jOWmGplDy5bRtazE7wlOr8dPHMiKcWLE07aqdDBTYGSPJCfE//JFSCEZa9GRn
	yhb/BPMGps3lyRWuCUjphcG1R6NIMfjDbau4XaoUsYkquqa82nVPDlQtnZehXSSycionpSGwcLg
	UaXgzTl/ItKQ03CTp2dAlOugzQ9SVIeoTcEtjoLimrLNKMBbCApR5jAJcWZuGxcwhB6G3xPEIz5
	SwVuxLhF2zZRli8YuvAPaooTXUBZjyddVHPi3Ap+wbpXRY9DmkZs+pyOMSKSmLytwLrNGwiMcdO
	fax/cIv1GA8gPfcP8VlWeeVfPU/rmq2FlSJRtbSTM6P7Pa8eqb/m8Ats+Tp+zlFppy2suy0rySS
	XhuhqC9VCNfHxDK0W0mtBxAwbqgmimT+hqIVDSas
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

