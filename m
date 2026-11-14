Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691849;
	b=QH1TaMOVRwhinUyzgMJWoGQUE9B4z0UosbGjCSdxUdTOSkWdk+ePSxHrtQKTXLddLgcC
	 XIHnRanpe9MJgg2hb1i+90/bXUCNCS+VoRT36PkrNAzI1E7ZQSAr+7iQ9+NPy9MGZ8Vqi
	 o0zVZ45q1pLmXI8quc+ZrCV/vQ8J9eayKLEhud3TsJu5SzcHB1Qfc/OYfl7npJgXHCNiO
	 A/z8Bclfea6792oJgEfFIEm7gbxJBs0NgUtgwlIv1GDJx+CvFRRJiXT6BcE4YQLCm995W
	 2+6zMC3/WrunJQdwA57P17PeThp6qFg1snPh3sc7yu4cfuBvunUbF4DyiBOcrxFCuAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
	b=aaEuOcnuAolCcXlF4Zy5lbz2/hJUP1oqrjJqEWA2bkCdizO0jtEXVoKwPmhZUvO7PRzu
	 NoRm3U7CLtbmhrToV/qZwBqzy95Z58czyJU/94sVYkrd1WJpXtIoHRrfgXk8MQPBnc068
	 DpSQOILU1Ku5Ck2DRzSqVePR/lwQImi/PzXxGiMdj1RRktxri0igB/QMD6VqqPZ15SaIn
	 jbCBYygRbAKERMoHMxFbaN+p4GOY3gt+3w5R4xMe171IuUuVa+58zkAyuuodBODXa9r+R
	 4iOS9IjvLgTLS2mCS/IKKWs1iggk7WYHnv9qm4jzRZy2PTqXn5gjLdqxeXPphAkTsMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe4whgMm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7684606A332
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7684606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe4whgMm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so9545665e9.0
        for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=Oe4whgMmIY7AJRUl/ZLStdHdfHu1DWj1T8uzBmd5CjeOcdGHkga3g03aJIkfbFQwIw
         j3b78I69Po3AdHpiDlhrTj4RfJJ9Tn+sn0jc404/3yUgZWa+XzwViJMT6apDaadBH5fC
         fMCmJ6VR04Rji3X3qYT/UiIvVfDu5p2HMuHILU2wQ9RShXcOIyv+7EtirVRcgRy0Y/zJ
         XxsXMZa9VvN2NH4i6Pf3zKqBCo3d0t67qlPWBE+RbzLophuBUeL412RwkM/IOs/QMUdJ
         JATTvon2p6IXdslRWSOiR89aDvr7035up083oZuw0EBEpYZYb0f7RoMzjmiTGIoJa1f/
         csWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=0NHK5D+mNygI03eAjHg1mrr15uqEbyXwTS6uuN58VumOU92S2oTpBDpF6IrHjIwUdM
         tbkW6z2RiYpIieyq/fPi+BaOuyiMhsNMrG2y33eCidLh0nF1mEh/7+OTdwXJQxzVz/qA
         GzXZYHuZ2g3ncAAMxOxtwTw5S7VNQLkFIMTp41eFzbJMrxG9C5WEgsQP17b48P2yasRa
         V4rIOD1RqkpjLKJpOZriI8+cLD4BvR3udcROhShKhW9JGvebwNJTCzYIfTd9OJGbZ/RB
         nJAHXP04YfTWvEZgDxQUap01eKohyQ9quxP7XqpeyJf9TLHg3Qu6CFpW4i1Ez9DuYi/z
         oQ/w==
X-Forwarded-Encrypted: i=1; AL+hErFaJ3XI0AG3/+yFgrev9CBblET8kz+MzLv/w1vKgCS2mQrcLzhoE+WuKToSZm8T/RZXzLw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Lfc9svQk68nA98wp3niVmeImKE3280HgGIZwWpExJHvpu4knx
	AX2O4S/m/Mf3Ii10geBmi2CM/3ba3cfjevbXPxd/5uHQhXokYoG0i7zl
X-Gm-Gg: AYBFou1GBxqVFgCm0qYrWCeyogOLk9BT9aMKq3uVF0PmOiYDhN2u4zx4VnphxP+yIXF
	p0qTRHF/GWOngdcF2XnOLRkCg9Yfg+izLt1la/HcI5bF/rfyBngM2oBdxEwboYqog7o1vFPw1mI
	RqMS12IBpWX6Q3MJiMR9nr5Qt7xmdO2Aq8mHltFlepNQu5tHC8XB7C1yWnbkyRlnQho4B3j8CFN
	n+ys9ew9iJZgpnDzEAgDNVy4dmWjWeE/wLVYOLSOCND4FsCaK37m0agOFHaqpEYsQNjV6Ft3tHw
	TL2wZDXVgZamnidxLvvpjqCZPjqPWMtFFKywgu02IA6T/uBRPTQ7A0dl9L9vu8O19ZxU2VUWywK
	RhiooyFmwc1itkyrGip5QLXmLgiPODX6+lXOtWrflMIHrhIz7cbvSKyn0U74LjDD1djr5J1Xn7w
	ivAMHfV2YXaCaXApmk5iduVbFR2MtA1Wn4lA3Bx+/sKy6btBNj95lwhc9qy7Fh+WFg8jaOeg6Uh
	uH+w1GjhKo+AyNEEmrQCDv/urkwcnW85vfz9MmX291QslgYMKSPUqSWGJ/uQQCtGAO0gA89W9Uv
	XXltaMPMqUKivrwvKmhEvGonCBo=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
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

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav
