Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7343DF000
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368068; cv=none; b=eVIVq73qBGivhbv8PRiEPOfxgM57gi0uSA0Rhi+ZiEXPef5J75gmPSSpMcET23z9aBW07by+1OLry6cprlNJXOQ0Qm9rH5cugZHLbibdRMhsd7Bb+faoPwPXBel2VMC73IzsDafHvvrj/fMJukI/nSOMEtwT4SzOA+pKewGhgVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368068; c=relaxed/simple;
	bh=iHbJlGeoMHgH2LOiRlm6X+LxFVvol5/ji2uSvnTz1Wk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PyZm0rF00aBdDyuF1v+woJuVQbxfq+Ig6CxoYt+eVzNTuUjjHXcHIYgO6kbuL7K/QdXKDk+iaBhAp18LLoOaLm0U/pGcdX/LCFw7+6HCd2pvAy/M0TyO7968do0yScQKi+KWwaa7C6THrmz5I+JU7uoW6tphatg2KFtZI1j/DeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnweckuO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnweckuO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso291633b3a.0
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786368066; x=1786972866; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhupBQyp7Yply8E4ipmxmMlWj129/OKUHeE3ME+cPLs=;
        b=DnweckuOCpcB2PxgPaHa5CHppBOzt8/Va4RL3hDzk59Wh9qTI9iY/kNb17YUFqdxSa
         cmazoIYymN2RFBsXJX8U39Wc5f2M2QXDmahbjse9SZ5PiUe292deMZ0BQeN+zSsN+iDn
         fKZnhpbq++TF9EB9KwajkR849YKo3sKUgs7BtJpCa9Uous98VmMZxAEVOQxa7tGyaORi
         zwZcnTOfK+vVx4A79qb9H6TUm8XYFKBQZfEaF1y3/Ae8h1t6z1sRFSdKVaipIULLnpUX
         Sedde356tlkXdEU0Y0Di28XsiwbECkpE9EcMluJF3g6+Z0gjz3JKbVjA2yTIbkTvawIR
         R/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368066; x=1786972866;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhupBQyp7Yply8E4ipmxmMlWj129/OKUHeE3ME+cPLs=;
        b=Xq7kUXYe+rqTsxXB9jZcvs24TLr8Mq+ZJ0FCvZN4+Ed4ulVrghNVcpXwPALuq8t1UH
         NGc7ein4N9oV3HCZQ/SrHpPCstTCJX5TAmOi3i1ZWWXxy1MagIXIxleksiUXdY1gAa6y
         ATuNfrECdapmw5rFJI5Yf4MkP23O7/441QZZBum6yWp7UMw+67EYUS0ygOn0hBviLRX5
         VJIg/mgk8Cj1IJGO/YcHDmbmU76mnsCFeObSZd8erILuT2YDcYylC95XEfTYTFq6qkZA
         xltNXUiTO5VcSzxEctIq2OLjuITn24/WPmV3JorAWUP3rJ58/nAbKcxgTWjv8JAkSe0n
         sLDw==
X-Forwarded-Encrypted: i=1; AHgh+RokIkoLYKI7bDu5sBo1s4HPI+Ank8y6BUN7EgTgdkp3TJAc3aPqU/YQsISr2lFC1f5d9lE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFyHRmzLW/oJpY7y7Ed6QlCsuCjMAuQWI6FLoq2Scbrrhx5nyH
	VtzrGwLEhVHZ1/fYo22uTMCUY7pDWRm5hc97SS20pyODN2p1THg1NqLK
X-Gm-Gg: AR+sD10lE902oCxqyP/nv4QJ4vH50zUjwn9WPYQvq/M39NE3I3158SJsM504J3ofosw
	lb6AABSvDjTCqkRXiVRbGZmQVBzlaGEJvJPd6qSiFFAbFX5+RhBWPJY3tE+WWoNTILHmEP47/x9
	siAlupnlSXIXhfVnHeLw0ozvZztZ2eh5ep/WENUTg7K5wypTzyFDkQKcvMHkSlDxpFC/sirus3h
	I5p223RLzUtLzID5oLoO0YLsUbfLYL0EUdNAjybEYdiYWm78wLSXEVUKPX5nh5zXk6CHjMmNwpZ
	C4F/xeMtdSp9T4IYJwzF9E0zlHGVem8Ib5mCkNOEhZrog9rqSDPt1EGNwkAyRAJXYJ736tpYvq7
	EAcnRSAlxuoMQApS+WCefJ3l/kGOIMjn7+nMjkyliFhncKOf8tYzkMMAI6hkDcm7pFE7zOPHxyj
	PppoZq+yKTZ370HI6AQAzKZ3tzc9W7xhVLBeTOxCzA73onjBs67W7iOSCUQUe7oaz/KIG3kHBMd
	JFL+cw0h9K/1rUECBX+Ckc=
X-Received: by 2002:a05:6a20:6f02:b0:3c3:bbe6:95db with SMTP id adf61e73a8af0-3cb85e2babemr37025734637.1.1786368066101;
        Mon, 10 Aug 2026 06:21:06 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f372b5bsm3982901a12.25.2026.08.10.06.21.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:21:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v8 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
Date: Mon, 10 Aug 2026 21:20:47 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84622E1C-DF59-43C1-A92E-478499AEEBCB@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 21:08=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, Aug 10, 2026 at 3:04=E2=80=AFPM Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>=20
>> ---
>> Changes in v8:
>> - Address issues found by the Sashiko AI review bot
>>  - Fix the error path of the probe function, preventing =
unintentionally
>>    returning 0 on failure
>>  - Reorder the patches in the series to make the change to the =
Kconfig
>>    entry for ls2kbmc to be the last patch, to satisfy the AI bot's
>>    concern on failure to clean up when the driver is built as a =
module
>>    and is being removed.
>> - Link to v7: =
https://lore.kernel.org/r/20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com=

>>=20
>=20
> Don't send several versions of the same big series within minutes of
> each other. Give reviewers time to respond.

Sorry for bothering the maintainers. A reviewer previously required
a clean or justified Sashiko pass first before reviewing and thus I
have to fix the high issues found by the bot. I would be nice if I
can privately send patches to the bot and let it review before I
send it publicly, to reduce the disturbance to other maintainers.
I tried to run that bot locally but failed because the bot was
consuming too many tokens before generating a final result.

Cheers,

Miao Wang=
