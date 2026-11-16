Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848215;
	b=qY53Imx96VP3+TEikDwUFaeeCAhkeJ7dJ7iQZxzVYbtsM6Q9YjCI08FP1AGjTLv2oKOW
	 MAd1AZMnbNzFP6vel87dgQNVKFVW4QbydrwbOu8i2QYcb0lHnoZgTYB+llTH/vagzf1LG
	 9PfmYVoN5J0jYCsmYHTUp6XjXQQqXl7Oi2K/rrDnP13T1zI5VgATTvG5XITB9B7cM+SUX
	 fZpiv8Cr4uxGKo+txGeJ4iXnlHoELTDflSCYs7O23//xXyXA0YTD+RnOK+NVfRrfLsAaR
	 nT3pylKajZOG6hBO3vuRdtqfQdOs5us7CcJEc/9+TGxUtoRCZnt4ugxcCnL7iHFVIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848215;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=fXvmHmrqaT7uwzqw5wKHAzK4b6YmdKrUYQojmN7r3o8=;
	b=MHR8UBQr4fjrcNE7uVdjA3hMVvmMaswsqwMPoCiWhM7AYtElXqr4+nwW1l6nBQt2KMTD
	 l1O8UVfjpYz5imY5lecgkjc7v/KTrAMSEsxV9l4TwCfb9YKcl2a54m1uI/HWBoH5xoH3s
	 PmCiqPowp2f3CYXX7HjxVx8Svo+U154xhvPul5AxN1btLvY8a1p429aEELRCkEdzlM8u8
	 WIPSR+PSMj+BEVGkxpNI0OovRiwshqBirMw8rs4u93Iy/6He7SyRKI3zXFF6g+ij4n1j9
	 pSIqiQgUSr1e5KlsQ/G7piPx61ZqxsLGwMSxSYCIpsoyr6nTHA7T7pCLfyFuuZx8t4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Xw2hAZec;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D01606A88D
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 16:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D01606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Xw2hAZec
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BD7A4E4145B;
	Mon, 16 Nov 2026 16:56:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A33E6023F;
	Mon, 16 Nov 2026 16:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1284711BC0F3C;
	Mon, 16 Nov 2026 17:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794848207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fXvmHmrqaT7uwzqw5wKHAzK4b6YmdKrUYQojmN7r3o8=;
	b=Xw2hAZecCTKO4IlSFWSosdZdqjUdxv6ytb39vF5n6H49JkwYw6OCqbScYgJ3Xx2kTiCuz7
	2MXGQIB/XmuwpFj9j0rrTk2TAD5qpLeZyPWySPvWFOaYi4TnQ/K14Tiwq3b6tiRwQQbNGL
	L1mBMZwOSQa+ANxkQiGvICuDkJk4DVCmmvgRZfZuIuZreh12C1YBXpFKeb1KjBYTyoIU9I
	hxr48CWoLnIHXei8q3tJ47nCtaMferfzBuDEBU3BpWR+NtQJe32gGrz9g9x2mN9/Br8yBl
	xceWNO670TkbXJ1B5Fih80OouheC+pe0XFKKzPG7TVCkz4MHWIj5ZV5p+dTXqA==
Message-ID: <728be2c9-731e-407d-bc14-513591aefbbf@bootlin.com>
Date: Mon, 16 Nov 2026 17:56:45 +0100
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
Subject: Re: [PATCH v5 4/9] i2c: cgbc: Use plateform data to get bus ID and
 adapter name
To: Lee Jones <lee@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
 <20261103-cgbc-i2c-storage-devices-support-v5-4-ac11f23fae51@bootlin.com>
 <78cf973d-3434-4f81-82be-a22f4abcfe0c@bootlin.com>
 <20261116154932.GA97865@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20261116154932.GA97865@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

>> I was ready to send you the v6 (with your I2C patch) based on mfd-next,
>> but I noticed an issue with this line. In v7.4-rc2 devm_kzalloc() has
>> been replaced by devm_kzalloc_obj() (commit
>> 4dd10fbbeb9c33709edc89916e19c03c780a0751). I guess this will conflict
>> during the merge. So I don't know how to proceed. Please let me know
>> what to do.
> 
> Rebase your set onto v7.4-rc2 or -next.
Ack, I'll rebase onto v7.4-rc2 as there is no tag for today on linux-next.

Best Regards,
Thomas
