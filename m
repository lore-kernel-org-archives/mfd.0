Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864484;
	b=MhHTN92+SGFHwSDZ8jylYvdYQ2uxg4Rdt6zR5mLOM2tNWRmHDDSAuqgxY33CA7BXP3Jy
	 DKJqRVbnN8BmmOkTuRSYemWYpDz3JWXTSUrQUS3RLrtDhwfDs0keaZtvuhFUFy5pDMiZq
	 fpg4Ak8RcZVSdSR2tcKtAlwHNTeX3WisH4i8GH5YTwKtFFwwcr7LjuDZM7YMv9VcSkrDH
	 T9Mkd7JcxaL5tlLNiyEe3zMEuvcyYZHX572RQ2S0OcAhNcbRctKLUhpu9UVeQGLmU0Atb
	 TzvQOS3jLywnFV8fS/2LxyCD765tJtf64KWU52dKPqP66+KxVEWk8B+UBH3pNvPNGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=OepkdnZHojCsgFtL1fZK7idoI4FiCztITxySr+TaSOyz2DSy0iBjP2xEtcL0iV9WP8gL
	 tNB9ULFrogbkzHoELRiiD53zzP1QVA3WJpGufkePq/Gtr+nXgq5TVCGkXGd3KTmExmvzZ
	 +IomYqMoRT1IscQR2aNafAm1Kmtljy/Iu+VbZeiRlVFnMqeORNJlc66cM6eUQUWQOyfgj
	 0GjE5kUNLFsR9YqreMeLTvRncawf6AxKWKj7HU2e6zK9EoYBytZ7mZpBbN4sBhN4LWmJE
	 2oQQZW3hx4urNBxfGUGXK7LSpXPM93uBBw07KFMArOfXpwlCNkZbfxRZd4giw8JgOTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rq/loJfV";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9D606A33E
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF9D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq/loJfV
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4246494f8f.2
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=rq/loJfVQ0C/JSja0j8uL2DZIWlF/UGTpaxuCjhSQjOpHJvAx9+sd7gkoMuXVvFS9h
         iVlPeamngn1+lpNOhutT4w2TuKWwhlgmQjwMBqU3i9Y/PyfkO2hQvR6wCzcoe8P3/t4D
         Qlm/dG5hNrtC1j41Buq4iATvsGcelwsNzA7mmSfDP0J4oMDBoQMwOzTcryFhV4P8b0rt
         S0Wj+3qQAqd8ISIXOtdQht5fM9Lbao9WCtatCozS8LKikZuf/kNtvw9638QBfcjpTgBL
         yw6I2xjDht/KOiKbp4o9FJe4GI3Za24XdCgkUgsAZ/o4Zv48qDV8tjyLMYiKKfroQ3So
         SeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=WlBuYJDeH/gUkq92JHTEERf7YTmzwteBZ06NTzkMWvRIn+i4Gu65hmHVt72KeKvK1p
         ke4zGeyPvX73lRdlXIoRqsczFkz0Z1JBjnAR91p7tMdxrSJOOkasoR4swx2TUKQMKOtK
         vyvMd3anqiR8HqKq1KmqpvVS7VzhRFw1Ik6c9tW9rXgyZcECiTg9ArAxqkZeGSklj8Vw
         CHbPDGRLWeWXY8PqiKranp3api2+56lUAuTbfjSDJceiZwXwlOb4HpDNvppOps9c3e8r
         InNJ0Ld3VyskiGWaDU+WGbEBCCpl2mpXbSGl1Rey+dxdz+JVGK7h9IkCCojJs1i0OHHq
         N5EA==
X-Forwarded-Encrypted: i=1; AL+hErGYhEIt+fpiIEQEDQqZI9DjhNmXyWR3HxlJinLuOAlg3gU8BeNO5VdZT33uB912INEA3c8=@lists.linux.dev
X-Gm-Message-State: APuU4Z97/pjQqI2NNlcuB6k5kIq0Gyf4h2d7iOY4gowusDChO+jC+J8j
	KL/PoCkBVvkoQmWrfa/Ef8acn3TF5XzEQCbDdg2E54/NeWolJjg3rXbq
X-Gm-Gg: AZFdTZdPHGGj9flA3rvAN1AE2b3C+yfPJgs7CAKcelMr58rHXgq5qZDYrUR8Q5Sfxzu
	EK2OBWRE7pBPQqzdSRX44VDR+K/pel+I+6q9rdKHoHCSZMaHRHiSKPcZp+5YUhtdK4I6lNvKY8q
	2cYtOBz87lRr/rZUyip66jTlDc10td3q1YE/P1nzi7syjh8MdlfExBVjozKQQlJym7BqzP+1dEr
	6ysK0DGuhasI4y8KJoanikruobdj5jrGBzzEWLb4tAaTWlcyV2irH+qmG65tm9ckIBciZW16kpJ
	LV2WGsk82PLKOEwHlpwKBg9JxcfBd69zYOxdwWGm9W+T7ASufr0kveJ2XHjNvVQ8L3fnQhfhgBU
	nPII+ameDm3FWPOUAwAWXWHBQ8hIlpGUb7mfvLVEMT6rX7cTM6QqHyhmHEco7V51mPvhXa2DZo5
	2CVGNuDM4u7+5iSpQdaZBm2b2cfbQh+gg9P8HNi/b8iUMmNQlexBxq29VoonJtfz3i2kIDSRg9B
	1DKDMCEno51mJ0730OwwnXhK3ZCjnMTtzuDJwk2GJ/6NUsLbD0zMsRd3r3McV00PLZjGN5uHTXR
	QjI34NLfbfXey9Q39xqg1qQTDROzrOKoHYC+Vbs5
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
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
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

