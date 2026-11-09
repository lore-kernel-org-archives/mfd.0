Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243864;
	b=tm1SNl04oX5TFrvB57Oi/dKKPNMhXqgEbRaDgZy6w0ip3XNoGTHOmHCH0ub/jO3tvxU3
	 i4x4MBxXYRwYLW+BkEJP1559OaA0jO41WSTtJTcohLSjOebUGjJ5M+wC2YkAsDFzvd8w+
	 ITcN/NHO9VA2vK6PEDDdBkRDc3qvxoD2VAdtfYxfDfeSLg3UNOxIsNWxPLiwsoZk2aac6
	 cr5PQoAeUzt+KpdXgF6tCsv+LGkj5mCV7pTNm9Rqj05864FC/My/ia503fbeFp3sNbF0P
	 uQDUHXTxrx36djRLkqlt4O84HCWpPtON0HwOtQq9Hg+o67ypah29WToJmvvrrOwaajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
	b=WCEHPEU0xsYV7bwsm4PCU1kJqdd78ql9Y+c2tKZccrtGSs5jTn06RcLJmWDzx1QuORSW
	 KFUm0i/O9DLhQnQm5SjzlNrpKeYIojFzSIykjJzAKaxL6yOcUGBeGaDR3nSN1tNOOX3Gk
	 TAsz+i55bxHY5jvTE6kRGeAbIXCs/WSNvd1Uuvb1kD5S53+k1MkE8oV1wEHDKbkhGFMA6
	 4//xB/lAd7v4MnHB8tx27NBTHFX1CapLxOKjx+fC8D90g8LdYPUTMsFOF924KHdQooQwl
	 3hPt0gLg3SOUBjmkY+zpe0U5r0DGVwkWP/n1VYrGHvV02g616aIhlw3UC1BEVRsf9JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXpWUKRa;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B971606A337
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B971606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXpWUKRa
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1831281a12.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=zXpWUKRaZ5RHwLVn/nBZlOQhH3l9x1eOSHy+rovAsokMcDCMohfzdsfC9XICTYei7v
         bvIgniVENgFdfd5S1jRdhIhZWkf1V3KiMeP7u/3BizQLOOQ4ZOwx1lJxZCntjrW9BoBv
         ALBh2EJZEiXo1w1Q7FMlTL26QX+7+lG1RLB621MYIObzgNM8lqRl+YwT6RpfPUpXTAkL
         I74OlcVMS6uEFsJV19O3vXvhIC7WORZvpMzDCGFCygBq+13s+BuecxPhPd6bQLpRfqxI
         JJPCwwSBEZ1w3PT9DnR2GmFCrWDoxdMvmnXhU4equ4hyG1hwrs6geu/wFbIRh7G50PZu
         7YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=ceZRLTLAMIlPFnT8Mj9KfHyDuaz5IwxXyJ5Q/isF6EFH2tASuC8adIfKcGF8J7qEjL
         NURPnVRYG/T3Nj5ywPwr3hTwlLnPAGyKkzWGlH8ma+4GNgKOgsWJhJ9fPqHONTf2+2bC
         dyLvNB0IJbWHwqv8wsJoeYWZseUxkmvquJJH7WGO87CZiO47fxocgVVln9fu84JGGRH3
         fZAd8MgWx2IiOwZRDBTC9yifdVuzrvcXVQaThddZXNFc5O5Ljf/ioBIuieo53CyS1fNX
         eBM4RCC1X5sGmw8J8RrmeH+9es0d+MIeTDXcrShG5wUZvGEG1WLps7w8bOiyhRLtY5YQ
         jfQw==
X-Forwarded-Encrypted: i=1; AL+hErF4FpjFdK5Bv2SmIAZW4L4laLCKnmCmStV45ebgJecGZiPezypvwvsCnAg1oMCiulgk3VY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+oR1lj9cqTE9kohLX38cz0wZd6aXbCunnOv3OKUSQA8PEMbMZa
	2y0QwDTl8w35u4lfLR7MkieU9Fj/HHBi4RI1rwOIe8Hcmiei0IORrmUw
X-Gm-Gg: AYBFou391GGK2iEZw1zlXUbE3GMUdMfaogxnzlB9RsnRMWZFlOBm+AY/MoToV/tGBVG
	UCCOoNFv7IAyhGsplIcK6Vtz2zGz2TnvtrnzSHEuB3lQdp1fDvnWmbtaFQpiNKGF/g9ah0FU23h
	l502sxY4ytqnprG32viSI1IuzW8996Jrrjt581J72kdegBwUThOfV1/hEq1OLQs+LGXvz/LFI4M
	hiF2T+wj8Jivg9NIxYrVab/aMXyw0BaPYdcsHv/YJCjuJg8Oy0NOUbDxibigKamzs+qh9g9jb59
	xRmOclXCliF/+fXMTnzfwmgxETDKPhZQ8maQFv6qB8A7yGChoenPkTVnjhsz2cfVknVfQcfEZ+K
	NnTun1kvMv/kRtALjCfOjslB3j809goU+xpsn0TyMhPEXgnAlBbNQcMqCpTk3PBrWcCk4EpaZ2Y
	stSV9CAzDxfG4UZwCorfR3Hkp0/BttlROC4rLqAx8dFiHNeMkjHIjR2Im8wzzKk82PJzfFLNkuH
	NFigwTGOrI9qaMI4Bkq8DqHjUEkGBsaNYDws80jiqTymER13Aauly2K7ZAnLQBiHu1zpril1IQA
	Vt2YNN7AR9MPRouKIa+/opdIbUc=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
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

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav
