Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753031;
	b=DXCfqqiu1iiQWFP/eiliuJG175LPjwN9zTCbvVC9SpVfOteTb/oshRw3RzPCxwdS7LNH
	 pgBwYg+xmtnpOgN/fKSkZV1OsXlueFPdNgcHECaCf8lW0b6iw9jpENvZ6DdPmAXWpAiN6
	 8X0/Wa7U+FzoD2eh5ley0/J/szJmfZU7IgmhO+ZIQofLLidvegd8F2HwHRKVrobtWjx+Y
	 CX+/Bsw1hnkEDagIDssTNmoQlQkyvf51VQoZzkZV9N/tZ9mGO4eXsKFALl35Z9xijG6bt
	 w433UrMyOoaKU3HjV/KCjgWuC2fSHXJpIQER4wclmjvRuqx8hddbyZJxgk+RFQEzNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=DfF04HpC3rjabDdTe+KwkWSZFROy+3uEg7XraPW3d80=;
	b=feZ68LSsWeboDQswxsy2Nn6Np9NbNr5Mak8bJMZ8K8I4s9xVwnxHUxpyWXZm52wRl3h4
	 PP0h/IKY52im6SEATb2ijE5Eg5IP5zh7FEYzUDeKXE+k7p8yPIUKNEjhQWYPOR8zAQ529
	 m3mFctjyyJ5VpV5pGfqR7m0Mp+8tUIlNxXRraLIBWLvn9P1rdenU/csmC/hKnoN5WhvaM
	 6xGJLg2CY7Y2GjYK4CVMWiWRBdUOevIaSY0Tl5Bbm6HRBZsdWwitp0BiYaz6nQIqD0L2P
	 xCIucgYwcN07ZQZEW6NHGE5o6Yxqch7tJ2IvhhcRLL2vt2fbU1w7Cga/ZHer/H2xqyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=lZ1qzGt6;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAC5606A333
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 04:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BAC5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=lZ1qzGt6
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jbKqm5xgRz5B7RM;
	Fri, 27 Nov 2026 12:16:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795753012;
	bh=DfF04HpC3rjabDdTe+KwkWSZFROy+3uEg7XraPW3d80=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=lZ1qzGt6WkgTTJuAdAV9uI2GkmwH00phK/dAv9aw/jEHdR6N/RZ06CJIuJLY8YT3z
	 hZYH53uUCFGd2iA/PyBXEqhxzOSls5GYpU3ypzy37NMsua4JmHCaFs9rIvqHXWfXuQ
	 BlDv0eaq11kf130IGjPxeOndDNxkRHvGoY2is1Tw7UFluUknJzzzfLEN3BSw2Zmo/o
	 rHIYMD18xOnekuCCFaVEggtM7WW+njOKrEdiQ7SSnF3pQKcMtQyCzAnUVT9vyH3Og3
	 vpyzKUlceBjmoXExGc1lPjAiRIQBFb2qc5lT15CDcFgM3y1T4TgsgIT9r0HSAmurZ1
	 U1R5KZ+YpG4rw==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6AR4GgvF090027;
	Fri, 27 Nov 2026 12:16:42 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 12:16:42 +0800 (CST)
X-Zmail-TransId: 2afa6b09042a94d-da297
X-Mailer: Zmail v1.0
Message-ID: <20261127121642555anJyxM6Uz1eZfn7gkOb8l@zte.com.cn>
In-Reply-To: <20261118174656.GF98456@joneslee-macbookpro.roam.internal>
References: 202611071607376342uPiYA9rHRC7ZI9Ix-8xh@zte.com.cn,20261107160743097R9VvfD_5S5vK286ZLzPhG@zte.com.cn,20261118174656.GF98456@joneslee-macbookpro.roam.internal
Date: Fri, 27 Nov 2026 12:16:42 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>
Cc: <mfd@lists.linux.dev>, <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <tharvey@gateworks.com>, <support.opensource@diasemi.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzVdIG1mZDogdHBzNjUyMTk6IEZpeCBvdXQtb2YtYm91bmRzIGFjY2VzcyBpbiB0cHM2NTIxNCBJUlEgbWFw?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AR4GgvF090027
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 27 Nov 2026 12:16:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B090434.000/4jbKqm5xgRz5B7RM

Hi Lee,

> A better solution would be to specify each element.

REGMAP_IRQ_REG() initializes struct regmap_irq. This table uses
struct regmap_irq_sub_irq_map, so v2 uses explicit bit indices with
REGMAP_IRQ_MAIN_REG_OFFSET() for bits 0 through 5 and bit 7. The
reserved bit 6 is zero-initialized.

Thanks,
Shao
