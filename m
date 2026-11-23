Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468663;
	b=F5ZHRLjNXJw7UPW0aRiXpudN/cTggouMdUt0CBaxjEVvmAS9T13wD1Qc+7EPC/ds1nij
	 VzTGqOAJ66OpR4h4XhbwcHs72bRKS6gDDK8sK4/6HdtOkwOKYDMDujlmsROT9p6Es4/Q5
	 oAPPaSfJk/XZf3iwIekfOZ7qcZhb7NnHt+nsiFfgeYIQvDCeWYg2yyY67FhseOg3CoP1u
	 VZl44sh5pCjcbUOnOqj5gYa6AbhVKot9M/D6v3BYDCFOwZqgZj1Og5iZAggcvFk85IEVG
	 cEpY0j1CTmTa4XfBiNNQfvgqp6YUqtRtY74pw43z21Ics+lIqI2+p6FM2kwQODLRBFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
	b=p9G9qjorCidVZ9yPycWFKefgPZkDvIBdbK+YbXEUe3P9YCMwEbSm9b4T625jyoBoG9oe
	 /E8HSHbZU0ezlmerXtXoMSwA1ZxdNvZww7C9RKtOdEMawngx9/sZnyI5dM7wTlxYbE0Vs
	 S6ulQFmqFNTDImlGwf3ErI/pvx0Z8GYfPQ7NyQT1/BfAclkSFhX52mp8C0upBKCM+5/zT
	 osPa+cyimcxg/f7V4/0Usaeg0QsE720Y+iyNq6eDvo6z1cRy1XlRlm9ILMNfnog35Wuh8
	 0MBGEBQwnMz/h0wjAwYF6UQmLEX7RUYGpraGM9xFYg9pwxEBrzKDUYrAz7aF9qilVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOZ2uZQU;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4144A606A338
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4144A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOZ2uZQU
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a9be758734so2317480f8f.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468662; x=1796073462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=iOZ2uZQU3NMqPJTvAsBqrp038UyRtbixC5ZB+mWoPTljOKxb3Tvi80YB4lHITqFJJb
         WPgnC5Z1T9A5XoikqrkgAmRlgzo0Ehy5MNxYgBStw8E7CKZiEFOjd2k7Of+a2RvK8Mn3
         Bh+HqbYcgPHhbbeDh/khf386zDO/Ce2ohkAiRX9mTiU2V8UhC/7USms8sYCVy19/+A+6
         8xdGKBQGTOEuLgRpTm+PsmZzC6umT87Z32sCd0T5nnkWs7gczUMsGZ+ifQxoIvObdo8u
         MYxdlgqMOXAVUP/5Gicdq0NKwP/ZZITQ0TDlGtJFUhmUtViJQM6WB/YfMORIl3qAYeRY
         W/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468662; x=1796073462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=sYmcZA5yTfTMS+p6gqeTNi3lT0c8lICcJHkP6qwNrzxWVd9RcR0h98dE3IwfcJfdHi
         gsgAjp29iCuBHRg3+QkAul8gm52kPatMDvmbrJI1p2BqCLNE3MjSFyuJ7NphdaGSAzkv
         qq0o42kW3w5kPo26VwR9P75lVNwyTpgsPZ8nMr04Z7wn8WnQL6l6mrzKUJ7+xdg6QVXq
         w3C9rfQzasL1BJNLZJdNZreQj+MsOVX7rbKMdfVR+iAxf3HK1myqV6LZCaA0oqnmmcmw
         WUekNxZAe90BaemqtipQ129aD+ga1PW5sWYWg5xJ58SnsKasjG0fFPrk9w/EQ251Vkmt
         VZlQ==
X-Forwarded-Encrypted: i=1; AL+hErHNgU60iGo8DDpYRPKgdgZPvm4+eHH/zGcRSAYzamAHDS9/3UbpZ+Y9VQwd9xhJUs3nq9M=@lists.linux.dev
X-Gm-Message-State: APuU4Z+x1yVs0ehyX1yPgS8Fir0N7ILtgt5z51Hm4G+8OPoSv0qtqefE
	U9aV4/wAUYzEDWTd15osE42SMS1ZaNo7aW/P3cBb1IzQfTFFtzylqHay
X-Gm-Gg: AZFdTZevcJnlcZM5HIFTDW8dhN2oqQQ6O6CI0dKah0u+mlA11Vjas4ImWJGyx7iApdN
	k4NnI6HhPs2z8juEqdf782GSf4W9/blqRAiobQRhllhjeZkimjzrudXE34mIMmtU+nC3BQ8VhTe
	8RpadnsNN+oDDpSp3Xqn+kZARjt0+lgVa5ObNDUgbeimdIzpnpesc+iyp/4LgYQ3uh+sj5B670U
	OIkY+WlabBGb4X4YJxV9FEoeW7+UAqqHHxehEntX+XAizYt9aUvZziOjgnBJk9T7QkP2aeHvbI/
	RiNFZ3xnjrHIfXZaoEWHgEEgqn4jdHHcoq+nkHtjWwICY0m04khRIOfr5zrh0RrbQwG1A7x0vkd
	+mSHdBQid23DU0SlC/dR7tIqb8oMdk/2yWR7oqxvD+ImfAqphqN0ZWdQGBGJ6bZAWZWjtzUuKah
	QRjx6YwanZw1/rqb3hvN95dGCP8j5qMcPiExiBrh0kE2Au5xYIMb74pWit0MUMl6buUmpq+CI8j
	7xyvb/b3o+BujASeAfHMxqaZUiQ48/L7mwS/eLyRTDzUl0Zfkd4mWeGzsL/XWWMQOAS74sdLx+H
	AmK2zW1o2Z0HncULpMQ+za1cMM2r+XjyqttQZSxs4pynHV83
X-Received: by 2002:a5d:4605:0:b0:4a4:14db:2348 with SMTP id ffacd0b85a97d-4abb29105d1mr18698069f8f.35.1795468661504;
        Mon, 23 Nov 2026 13:17:41 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm24513121f8f.6.2026.11.23.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:17:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Ulf Hansson <ulfh@kernel.org>,
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
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Mon, 23 Nov 2026 21:17:23 +0000
Message-ID: <20261123211723.1065310-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com> <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com> <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
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

On Mon, Nov 23, 2026 at 01:09:26PM +0100, Krzysztof Kozlowski wrote:
> This should be rebased on my patch removing the IDs.

Thanks for review. I will rebase it, but I am not sure about
the order, could you please clarify?

1. Should I wait for sending v3 until your patch is applied?
or
2. Should I apply your patch locally and then send v3 based on it?
(but if something changes in your patch a v4 might be needed)

Best regards,
Stanislav
