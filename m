Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE325335BB4
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334630; cv=none; b=S2/mZZ6ON0YtxDoROQ3UyLCQnwc6prC6mP4uFlmaXViOoqX/wzW00KAJBkfHfyX4bdg/x+MR+F0CthtBnIOSuz7028R2tRlikN3PZ4+oB0ps+TNcB/JC72hCMnsY1pdEoM0bSpCy0UeZwRHhGhEdgogn2ASy5vwKJ3c9k7euD8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334630; c=relaxed/simple;
	bh=7qihWULzhNXrMFY/3lzqq7H5HpmEEjJl5mAZAg5n+k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BS3EJk4Ecq0epJJN9DuDFw1OzeAE8Fa79lSLhXthYuXpc/etY7PXCeuKFG0cexvl/zT9vgujKImxb4E22kWqC8qQWYi5L6ITfeq6C3aw/XePICaoO7/QOJOQ1XsF5WlhWig2JYLG8xDQR2LtlEohYIjZuAN8lAX7VXuQhWbyMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBfy3o2n; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBfy3o2n"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451e1066971so1376685fac.0
        for <mfd@lists.linux.dev>; Tue, 06 Oct 2026 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791334627; x=1791939427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=MBfy3o2nU+tVcsNjIHsTt6ua/d3/OzVPgmAdYmyBm0X6Mch1IIq3mUDvl9H2KYu6v5
         evHiXYwasRBbzDTjqSL1lqMX1cV/iH/1sGG/yEx/j1Ojsi4De0OfHr+xYhK9ovFCYRrl
         m9EA/XLXOfBemjCRgY68CmIrrV3bOw0H8jCEJkGIiHHAPxMULRl7+w82JzD5++XNsaQg
         2ZHzLpNGl53vmn2uhBHSTdV3oulXQRMZeT4NIJzLVcK7XrjV5f5yI/gOawB54kct87yl
         IdhEZQHTg7pl2oPdu+YN13xWyoQXZ66DhJz+GRf+wkgkvG2ApqjjVl1u+ghhsyt8bGQj
         xhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334627; x=1791939427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=MwvA4b2OcuuNdObCTxWm1vSDKUvyZnrXCtW3vAQ65T02GKT/VJ6FAr/ZEioLcYUONf
         YZ+s1XjG3beEEHWR0QZk5aTCyCZUl0d1xhh7Kh9Tefw5AhXYZlOOH1PWDJnJo4HQssyZ
         LhWWVHGZ7ncuLN10po9cEUgDuQqPeOtUNPneDVIGp/CgWPog0ziDi4p4hi+GwdaRWSDP
         /TWoj++3hcXSAHp7MpGhmDQhHJ1YwfWJux/Obyx60pE3sLahsq4m0hPmX7HH68of0vW4
         umyOP0oPrTfHQJ2x6SFmeU3AjLyQMZTTEDV81qJXIEAM/iXdG/6piQ2Ft4BEn3G5uNI5
         9UbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzI0JH9DxeEYu0jP+a84Dk/FuQSl/+FPFti1iZNzJ8LtsNlyZNcbcwRH2wtJBlIzGt0co=@lists.linux.dev
X-Gm-Message-State: AFuF++liCUH1wwbXUs2wlsMbfYlZXCqrxepBM9wryCf9N6CDj+/3Eck8
	kqZHUy7WfeP/0SAzglF9w1JKJUdqqPoJqRC8G+ypPbtGlcCs9OpE42AM
X-Gm-Gg: AYBFou2DiRIlyAzbmHBHFPMIB/olEGr4gQz/DToWKDAN8sXYUvxltzL0WKf4YqI7D74
	Q8QbW2h2eQUZ/JjiOTmrYZXJfFDllfdIZHgC6usiUV1HUXQstMRUshDQUx0wzHxCawwv7AtimBX
	+bBQawK16CWDLwq80qdNYJQdZN6dlzF+LTaLi7gqRCInrb7sSW/G5rn059xWeWvCcg3ZfZ/V/hy
	foHNdhdmQ56yWLYe5wiSDIux8/+wQjf7oyLV9u+Pt5YfrO/grPBCnQH9fZi8AG3uRkwJcTGEb7/
	EUUNPE7m/vFT4aARNCyPUJWDeTvn/5EQ5oG4VaMYpyjrPAGLC76qO0jrUQNeVh5zLc6oG9TtUL1
	NUkcoeX6ybhleiwYCRnGTq955N+PMrWV4DI+nAeSiiybulaDPvs0WCe4ZZ3Gcp6e+H61PkKVnzl
	CbpXuKFDNl5OzHlAr3A3T43Zp3OTjwplpmVkZTBL+zQLmdhF3Ychot5OcH4DbRWv+3TELM90657
	shl0nIqWEbbHlfck2H6BVp2WaBHc//H9SLvgYaisUxkXif6qTkL
X-Received: by 2002:a4a:e90d:0:b0:6dc:e1c3:b2d5 with SMTP id 006d021491bc7-6e7a913602amr915341eaf.75.1791334627605;
        Tue, 06 Oct 2026 17:57:07 -0700 (PDT)
Received: from ?IPV6:2600:100b:b034:8212:4cd5:c80f:ba72:80cb? ([2600:100b:b034:8212:4cd5:c80f:ba72:80cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25722e3d8sm1005183fac.15.2026.10.06.17.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:57:04 -0700 (PDT)
Message-ID: <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
Date: Tue, 6 Oct 2026 19:57:01 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Chen-Yu Tsai <wenst@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
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
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen-Yu and Sebastian,

Thanks for looking at this.

On 9/30/26 3:17 AM, Chen-Yu Tsai wrote:
> The syscon node is the provider of the regmap. You need to fix it there,
> not duplicate it in the consumer.

Unless I'm misunderstanding, no driver binds to that node, so its regmap 
comes from the generic syscon code, and changing it there would affect 
every syscon. Lee, Arnd, Mark, would that be acceptable?

These are the options I see. Please let me know if there's a better one:

- Do what Sebastian suggested and make syscon use a raw spinlock, except 
when the node has a clock, since regmap-mmio calls clk_enable() under 
the lock. Off PREEMPT_RT, nothing changes. On RT the lock would no 
longer be preemptible for most syscons, including across bulk writes. 
Most syscon users that do bulk writes only write a few registers, but 
enabling the Amlogic G12A PCIe PLL writes a sequence with 40 us of 
udelay() under the lock.
- Have the pinctrl ioremap() the node a second time alongside syscon's 
mapping and read the input register (DIN) with readl(). That read is the 
only access the EINT code makes in raw context. This would go around the 
syscon, and it requires that DIN never be written in a multi-step 
sequence, which is currently the case.

I'd like to know the best approach before sending out a v2.

Best regards,
Ryan Brue
