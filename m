Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219442;
	b=JTwUPZAEUbNcIflMzxgou6P/1D0wbauT8+E4viktw9MSjmFpBNdMgwEl4Q1d9Yt4vMa6
	 ThHy19Vh4YCgm2UWHSHI5kIa/vC4ccVjA599munaPzuUA/BIavOwb4iODVJAn8lcDCrUy
	 5E8UTwKBhGfzTGTF9jphokDBVYEVdghZpfXqEVAv+5tXiozxEGP5jTPcaLRex4m2nn5O3
	 nehfRUSpVVSJHCO7Ak27x+3heuYZxkuJbQC/PZFPg1O5Oy+gi2YFD7DFO+dT5RScziKc1
	 Q3qg4P9YVP7MeK05J3o4uqh6YLBXYKdSh71jwo/hcc66HVmCzJfm3LXFbevkrI8hGBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
	b=1AeJAChmFGt4DkMOBH2bwKDTxLQitBEgJdzYvOpVedrr9Q7lcl3rcfu8vQZ20SdD+ofX
	 N1XNmNEbgTH8sceYxcEABiuhF9/ult8D4otH/CRD+Nz5dVeMolNRBl6opqVnTeemhYhOl
	 6Zp3WIW5qZ/WLezd1z3/3ISZfCBDJaUqxkw1+z4ML72/57+U8dmlbY6jMkCm95NB9e+yt
	 cghpEok8jumJHUGHvbJMit2hZNRNedG2ELjOmvsQtdX2h7UHpkBS7lMNsU+wMYvGoOhk4
	 /LCCnTfTAiqpe+XAc0Y2CjwQgJ9yBNomdo0aebi9XaIJOhmJc6NGbYx26x6KbhBjrcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnG61BgV;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A883606A31A
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A883606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnG61BgV
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so475999a34.1
        for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219440; x=1793824240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=XnG61BgVPJUeE+5vPSb+QwM42wDInGnowESkxUK27qSvDeiZ9M0n78e42BtLXk83/J
         dg4K7lV/UMsztTCvNzLeIzwfYNSaSLnYWikslAEfUlWRYycvpoaHqK6fOTWcdiGJ91J0
         S2xKYO5xt+2I9ZcPo+Bx7ezSlxAnGaFGY2EIL79Y1qmb+01eOpUETZMhadV5Dh6/dJdt
         6rh/gKPw2ZLKXMJGAtZZXCBohq3sQkXcy7Wx1yEKmTjJSz/Vor2XYXnBHaAr44bzo9M0
         qDCLLXKR1+17Bhpv7yUic7q6TBfIleOaFp/GWbj0bPuEd9xVCecqsmleGQtWZcgQVSst
         C/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219440; x=1793824240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=R7f/LP11/qsg1aRsCqPSNQMi082S70fwPsxIEMslIjk4A+NLXJ8OT0NM1J461Co7Ex
         cG2TZtTAdub572qnBzdsQBj2/yi0kZdzIf9fD3oQz8AQXXhuMTrxpAMIcpMJ9Ux0p134
         lmKzLEIsc1lPJsa3LCWI1Fqre8FLCssHR/C8hV3qqWGMDAnkGPTR1NcpDQIWK+via31Q
         oN26bqJ58ueIHBJFoQKi6qKy2ggVGfHh0ZelwLzPfnmynxNvUkwp5et6NDiXCwYxDu1b
         5FCdR2H+cSKog1sSPDFYAQPFPMl+jNvSxIh/vK4V29Q/j/ma4OH5q2hxaeME/6EYgH3/
         Y5/g==
X-Forwarded-Encrypted: i=1; AKwUvBya5vKIm+A1OHIDPi7ym4dPVL1QPA2oM5XDUr9lvux+xzczyXLyGL9+XLqlIg7B4jBvkAg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhQF4GLrKOedvAsAKDZJKbZWC2iXtQvZACHVBELTUtzdr2c0sq
	7DrHCbV3oN13GKYoTRCxOAEaWgjo/bfACSXl/ji/VlNKx0ao3RP/UvWp
X-Gm-Gg: AYBFou1FWG2wMrMHUJ20D9X65GqJ4fq/j75NxmnybuazTRaaQzdthkegZ/6HBCusDse
	bmPkl3D8XjXTwEcuZFvdEHj8pDLNXnIGZ3hLOcg8RqgLQm7rDqAgvemi0ouwnCO2HVAnZGU+R8J
	al+L8vdW8ywQXDAluBNy1q0i7PSPhSjyNY5fwK+FRzN0N9BhB8O53SUlp6T5YqrQFrgwYVofqD8
	ti/UfNrqkCFZY/RU0d7Kdqr0B1/E/aG1VCPnqlYyqiQOKM8zhWuW6FrY8GyXiMF/Wbbt4bKPBy2
	pHPVZZ01f15gpEPlKu9YdVj57I/pXyRDV2UAXKdVFkcpwdSGdMB6UK1F+7SBqU+6e9DUlp4KJ9P
	yhMVIScT4kLNL+36lc9YHMNu6n/uC6jyyBr+m2bZjJ5KQIwz7qpu04+oFwialQrPoQEn8kBwazE
	CwXa+csJX6iCFmMBi75yNu24ww9oVIK27zZwrLcZP5Qc39IM3PT2t2rPx/laAnKhJ/LCBJx1Enu
	JBaOaPYAuoiWSe/WUoVywDHUv2tq+AuJCNAm7KMjrhTCYQL3AB/VDi43NnMdZHEKybvenFJbzSi
	J1Bl7XpoK2GePeWYuMkc17DIKdrUQTqpSLJQnSpwxbmBIMMSLbHeSad9Scvbqwk4IAj0N1Ha/RV
	awwr+mRbRUZgxBwSapUO4u83hJYB9yBYNacDb1OMxcQ==
X-Received: by 2002:a05:6830:680f:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85ab7b0d6b0mr3330153a34.17.1793219440535;
        Wed, 28 Oct 2026 13:30:40 -0700 (PDT)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm2618813a34.1.2026.10.28.13.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:30:39 -0700 (PDT)
Message-ID: <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
Date: Wed, 28 Oct 2026 15:30:38 -0500
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
 <20261020073236.dDVmd3BW@linutronix.de>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261020073236.dDVmd3BW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 2:32 AM, Sebastian Andrzej Siewior wrote:
> bulk writes could be a concern. The 40us delay is within the lock
> acquired? If so, could this be done without the lock? I assume this is
> part of the init sequence so nothing should use the HW so the writes
> should not be interrupted by other writes to the device.

Yes, it's under the lock. regmap_multi_reg_write() holds the regmap lock 
for the whole sequence, and since an MMIO syscon's regmap can't sleep, 
the delays are udelay()s. The PLL's enable runs that sequence (13 
writes, 40 us of delays) whenever the PLL goes from off to on, retrying 
up to 10 times until it locks.

In practice it's init-time, though. The G12A USB3/PCIe PHY takes the PLL 
with devm_clk_get_enabled() at probe and keeps it on, so it runs only 
once. Nothing else writes the PLL then, but the lock is the HHI 
syscon's, so on RT the other clocks in that block would wait it out. 
Running it without the lock would mean changing how the meson PLL code 
writes its init sequence, which I wouldn't want to take on in a pinctrl 
fix (unless that were preferred).

> So it would be safe for now…
Yes, that's the trade-off with the second option, which relies on the 
DIN never being written in a multi-step sequence. Nothing enforces that 
though.

I'd like to send a v2 after -rc1, but I don't know the best option for 
the fix. Still waiting on Lee, Arnd, and Mark to pitch in if they have a 
preference, or any option I've missed.

Best regards,
Ryan Brue
