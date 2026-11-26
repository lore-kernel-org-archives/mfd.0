Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716271;
	b=uaS5r1E9srnJ0DwqPbVTDC/RSMpKE9mfTR2izUZPOMk3apIfgy2yO+Ay8y6eJJfVqWI/
	 sNMYLu25RPAis6mgLXVH5V+Sn56l+k4j0KEYeIpnT2w0gqwjHM+XKISkoLNPaCxIpObsF
	 c8c1Ka62+kc09E5hYePtveGVcaUchpDutwXD0gmrvTePT2dO+uSRp8ESVyP6LwY/8PrbQ
	 Otk1QsdNwCOmxvLHGxJFtZhHvfqG7YjCmymKTjCTOmwK0i/OUmbZdcVBhN7UektAXBLWJ
	 knv3N7h7WZFBZbjjXbuFbUrJCKeTGQO3vqq3GsH9I8Gf/w+U3Y1YOh3GHiqBG9nntDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716271;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1c5PCbIwwV6vQj5//fN+ktrM/G6dDkpUjrvlgV4uuqc=;
	b=PcBaJUjFF73DT0NdiZ0dNvLLeWGLt4eziWPwcHnPeS2Vn5RE3ASZCrGN3uKpp2YytrMw
	 Su2PQvcpXCJVD8KcUJnui9704iFXqBJAbcwfWWPJyI/2kkcoAWq+o9YkKk+uHOmSiDwxu
	 wxtGcWWZXJy6L7BVbJHrSlHLMXAGU82DMjDLlQfm9KGd4DYH2uWKKi1LHLCN4sfzoI7lg
	 lRNy2nLuYqLAfT8AWFIxzpYSHDCQd6dZ5G+b8gKyt2jRIk+jmS95r3veJ+s8iYt86Uaas
	 uPK4/g8NIMKs2fAByFuk0vEloH4gXTX5H/+hUMDxWboKTfwHOf740yPi9zkdpviMotg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="1yEXqF/A";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E59606A321
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 18:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1yEXqF/A
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C4AFC2B9D5;
	Thu, 26 Nov 2026 18:04:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2981860558;
	Thu, 26 Nov 2026 18:04:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED06F11E69016;
	Thu, 26 Nov 2026 19:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795716268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1c5PCbIwwV6vQj5//fN+ktrM/G6dDkpUjrvlgV4uuqc=;
	b=1yEXqF/AvWVGxDC80ZsqgZJgPjMtRtg+ger1/TeF3eFPH/8UyuB8f8Iwv0O3KAOVg4S8Kz
	XdsUwf2RUkOy4OOTVrgJyCxjwPJQ/qBawTLHUupzmsi5YdlpTS5Qn6/MdCF4Aj4kgg1g5y
	6HIUJTHqIYXGSCIM/S19bBjs5p9ac/OKPvqUag0+HImxb6JkcncYWfhPWwNIQKo9jskPdv
	XTKnJDTESorub4cQtkPQcSOa58ZHZF0FgmpVcGkh2noaKSX9s6vgedl4W6EntEK2y0XjD5
	VHjqRzbkzJ9gWKm65mXutWoAcihLNbDi1ds3BJfCibZ7LZzWP0ksotHJi1e0NA==
Message-ID: <ef2953ba-1510-4bd8-85c1-81d4e45d2693@bootlin.com>
Date: Thu, 26 Nov 2026 19:04:26 +0100
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
Subject: Re: [PATCH] i2c: cgbc: Fetch the status of a write transfer
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Markus Haberlander <markus.haberlander@rosenberger.com>
References: <20261123-cgbc-i2c-write-status-v1-1-5b0fa0322b57@rosenberger.com>
 <179568834099.302193.16315749597111506309.b4-review@b4>
 <awgwO98qx3zX4MaY@zenone.zhora.eu> <awhxAlhwF4QF3V6a@zenone.zhora.eu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <awhxAlhwF4QF3V6a@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 6:49 PM, Andi Shyti wrote:
> Hi Thomas,
> 
> ...
> 
>>> Yes it conflicts (compile issue) with the series [1]. The possibilies are:
>>> - I pick this patch in my series and send a v7.
>>> - [1] is applied, an immutable branch is created, you rebase your patch on
>>>   top of it, and patch is applied in I2C tree.
>>> - [1] is applied, you rebase on top of mfd-next, and your patch is applied
>>>   in MFD tree.
>>>
>>> Andi, Lee, what do you prefer?
>>
>> Let's wait your patches to get in first and then Markus can
>> rebase on top of them.
> 
> as you are going to resend your series, would you be so kind to
> include this, as well?
Yes no problem. Thanks for the review!

Best Regards,
Thomas
