Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA42423A66
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777652; cv=none; b=JT3pHQijOwHEWeTizHPml9pfv38cwmI63vVnclvlwbfi/IqzM34ZESdFgPcbBRpaeacTT0W+UgIiXGJRxmIHCOyf4pZRwACRPMotgl501BzjxrdYqioitC6iTm09IRlel3IoEPKvWTnrV+VQC/FiiEmY+/YldLFSaNxobvZH9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777652; c=relaxed/simple;
	bh=zyYG03tMhaObC+0HIHVJK8kKJMjB519sRgHuPqlpedo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=I/rn2FwPpyInNLmKNiyZPhrCcIPPztZqvpGMSUJC0Jm/tq4mEAa+GEC7DPAMo9Y6YCwQfaf27uuyLBGnAOQqBwvA6mbaYCsFklKMa8HFmfxuirsiJrKWX6smIEfKmCuxPTkBhpIwxV3ulg92TobdnYpNrcl7QB9qiFHefquldUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKExgmcm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKExgmcm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848c995c29dso295890b3a.3
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785777648; x=1786382448; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zyYG03tMhaObC+0HIHVJK8kKJMjB519sRgHuPqlpedo=;
        b=VKExgmcm55JpD9aZnpW5r3PtCf19z4hmXvf75hEhs2NLWgC0j70rCXIHvO3ecx+kLr
         JXpFyuxyLmj567Nd7++DZzG+U+BmjkrfIncVVU6x5laOifcVN4LkfOuc75JV0+qtlv2P
         1BF+r6OQH4ALh1gzQ+Ky4aLT+NpOOjrbX3I1cFe7FyxlbORKoonKc+4mg0+Pq+rSuPKT
         jTMGxSGmXMBz91sml2YyE/id9+k3T078gix92Fb+cbJbZ/mmwaIZlXroeAO4RnnmvdKC
         8QQsMUGFAQ8JYVVJhVR1k66+ZR6TC6p7GuE/hivDaloT46TMyMjVKYFXwRyuxhC6XA6j
         Z6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777648; x=1786382448;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyYG03tMhaObC+0HIHVJK8kKJMjB519sRgHuPqlpedo=;
        b=W/onxxiSjDrbQx8DsnF+48MxndFL1E+Wc9Ir0vfOF9uO0aZ9N2gnYTrU8/DrqfBXuo
         zQTYMlhR1jVUbipCZbM5t2JgjGqzDMkJdsWVN7AK6cBtA92+23DMPfTmQXlt8DGZGcG+
         nmAIghhAgjP+wRFuIFXo5nV8IzsWxYyhJcHuzxXhowVfk1WPujEqJtkLUAsGrzR+470Y
         2KWlvManmnwmOo3IQd/3mbjdc3n2aOxWNzIv5YbLCv/cb+kxbLoX/V9aFnnAfE6PuYEQ
         I1Lhe98voBZ/jlWjCK89hlwd66Je8IQaDGKbajksPj86wWemYp4jjxlrajBVXOu3HufO
         rozw==
X-Gm-Message-State: AOJu0YxryzpT6Yu479jxHzMhCtpzEfYhX1zEebD5x0Jjw9YzIcsHUD5r
	hDbO+Y/gyc5Cyym26K2iiTWxKd8Ju26FUKe7eDIy/kMzjd9DevQ6av6pEAY7TX+v1roKIw==
X-Gm-Gg: AR+sD106MeesOssg0dcxuptz5aXXMODKTy7tteiRPub7VStuy9YZ4EGaOkWiUnYhHnM
	Fl6xynq6Vq3NeLSjHjcMv2kdCI7PzfroF5CXj625Tp9FE6/PopoLIOLn6E512gbQJW8/w+jW4/j
	KwKPseIxgWNLwBf+jWs90CW4jLendjhFsljxiP1h32vS6+tmnwn64thuvfcSyCBQllA4EsMuyJI
	YA4gXN+9jEM6IWpwF82WXeJz1xRtIWGJuvs0dzZZhGpv92FiuzPniW2nKi3w9JCvxXIDX7noYaS
	OQyCKj9d74UG9yGdFeqiY+8CS3ORqwWczhKjEWzPuo4/hEd1SkuPqKWXchDD+KLItLopwRLcVZz
	AxN+D8sNwYoHTzEMscgHFlyMrjCiYIgXC3u/8uzCyY1DsfIt3sRTWMae2Dh6HzuWKwm3Zwwp/8E
	q9q7m2Bk6PqXYKVat+HGFiAOrujScEYSrdHHf3lIbNGA2tTLPVz9tovhaU646a7ATf9iZ5fnOt0
	H5MIuD/u2o=
X-Received: by 2002:a05:6a00:420e:b0:848:5451:cfa8 with SMTP id d2e1a72fcca58-84ee45ad582mr14064936b3a.0.1785777648119;
        Mon, 03 Aug 2026 10:20:48 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe7a243sm3996750b3a.24.2026.08.03.10.20.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 10:20:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <20260725211039.GF3526803@google.com>
Date: Tue, 4 Aug 2026 01:20:33 +0800
Cc: mfd@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <040B2A9C-4411-48B3-8FCF-46623B85F532@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
 <20260723112903.GB3363113@google.com>
 <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>
 <20260723131120.GL3363113@google.com>
 <73FED0CE-3263-4853-9402-5D0E081EF780@gmail.com>
 <20260725211039.GF3526803@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi, Jones

> 2026=E5=B9=B47=E6=9C=8826=E6=97=A5 05:10=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, 23 Jul 2026, Miao Wang wrote:
>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 21:11=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Thu, 23 Jul 2026, Miao Wang wrote:
>>>=20
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:
>>>>>=20
>>>>>> Thank you for your contribution! Sashiko AI review found 3 =
potential issue(s) to consider:
>>>>>>=20
>>>>>> New issues:
>>>>>> - [High] Unprotected access to `gpio_chip` without a NULL check =
leads to a potential NULL pointer dereference or use-after-free.
>>>>>> - [Medium] The ACPI memory resource search for the GPIO =
controller only checks the first memory descriptor, ignoring any =
subsequent ones.
>>>>>=20
>>>>> Looks like there are a few of these to consider.
>>>>=20
>>>> Many thanks for your response. I was preparing a v4 to fix the =
first issue
>>>> found by the bot. However, I believe that the second issue is false =
positive,
>>>> since the memory descriptors (if more than one) in _CRS are ordered =
and the
>>>> position is meaningful for the driver. As a result, only checking =
the first
>>>> descriptor is acceptable.
>>>>=20
>>>>>=20
>>>>> I'm unmarking this for review for now.
>>>>=20
>>>> I still want review for other improvement suggestions. Thanks in =
advance.
>>>=20
>>> Due to extreme workload, I need a clean or justified Sashiko pass =
first.
>>>=20
>> So is there any guides that I can refer to to mark for false =
positives?
>=20
> Most people reply to the feedback and state the fact, with a little
> background or additional information of course.

I have successfully made the V5 pass the review from Sashiko.

Cheers,

Miao Wang


