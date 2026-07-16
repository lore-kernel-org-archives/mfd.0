Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24405422532
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207136; cv=none; b=bEDDlwxx/ddObnGBX2Jd3m2W0n1SC5n1KnHgFCviMQhOrT5tigVV1zNiCaFPdsfr/dRDa/8zvxB7eGQM7gVCnQwKdcMyoPybQmt6GCPqIhykriuOWo6dfLJ0bx9qGLIumijAnQ6B77EkXPgJk/9dXzK5kYAqlkxxPq8nTmQ174U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207136; c=relaxed/simple;
	bh=d6tl7JdLuF0ekIqFo/jvHkyX2vVbWvIrdRVjRFy8j2A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NU/FkClVAcVOHugSbDlbHSBKiPhO9Z4VIbGGZZ/GjzZV1MO+cQscG7Ii/rxh/Qf1k1NeeSwrjdUviTJqUY1bWGKRbu1/ce7j8610c1Hl2Nl2ck76TH12Q1aKeUhhSz0Ky4uiJjTu5XlDJpldXnSlCDrRa3WiFswB+bimN9dceK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BTraVMLx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lL9Gznu3; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BTraVMLx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lL9Gznu3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A08701D0011E;
	Thu, 16 Jul 2026 09:05:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 16 Jul 2026 09:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784207133;
	 x=1784293533; bh=A46+cCYRSl+QXOOz1rQgw9ZDTXSXhb4+DOl4Kf3/dIw=; b=
	BTraVMLxPrWsnFMUqPrAPXxmyxFkCZG7hm4tOJobNmrQX64BSJFFx5s6IBSFY5F4
	uEyNfw+1JJlesGgZhCo/sKLP5nck9bSbwH+HRHvSD0sA/YZ0vkdulZiJAQX/wKd7
	tg/hw82lOJ5DbYN/2BAuWtnCZ6xMzGnEhdt52uOot+CxjCYrL+0isgf73oDPZYk1
	L03e2z3bXwajp/Yzfgkfef/HH17e3vJrxnho+n6P86x1hU6raJr+Eaf8WaauQtrp
	wdJr8MRrN4x0dIz6LvZRWiNyD9Wn0k7qVCq3G3arjE+EoGZ1D9k5RE26DZ+LhYQp
	SNdyw7C2av2KIeSkBwqYOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784207133; x=
	1784293533; bh=A46+cCYRSl+QXOOz1rQgw9ZDTXSXhb4+DOl4Kf3/dIw=; b=l
	L9Gznu3FSUda3/dN2WgJArlKDwzZtpSN66HxV/MSPTw5MM5QNXERny2HkN1VyoTY
	38bHC2OBKioNbyQxb+cudIgB1+Vvf2tKvlWquC7k+kJu9bVOdH4lEnhj833Y/Qf3
	14HOGCiw9dxFB9ryHO7SLtRkAVdpFM+K0Ym/tlofwBBjV9r8tJam8NiofsqrHeeX
	Z78MAqCLBMpO5ZZxix/8nVFRr6jh1EGX0aEp/I4GJ+z7PN2g94QQMdaBZ52P0QFn
	2IcJKnskTU7gyyErGVnosvegZILTI8iz55qZitJxYVKYLkQtTbLS9IrmWDndLeOB
	/3mcmAWIOV5rLoyydCmlw==
X-ME-Sender: <xms:HddYalCVNY47f28sdW-9SV6XijVcGe-V3gsK6Ek1oGBKiLTWjlrjnw>
    <xme:HddYauVGRZLojsMaj4Ka9jT5HiBuAPPR3KvokH40PyWNK-7Pal7VX268JpvoH7ebl
    nXiRIZdjGr2GqLaXj5C6VBwJmILRdXebvUsufFGIEqS2t4R6PAudfQ>
X-ME-Proxy-Cause: dmFkZTEmleuyMjAu48RFq1YTT5FjubHZY4MPj1aP2kYkQIrHBGz9cPjwoWAGPcK4NcPP+d
    uEl0mzRNmFjuSS8ErCx8j5iuG+/ON46QgckdKgL2s2p3FpZkfxfpRTdqxLxPWbtOD14Jf6
    bxp7nW8i+fHxQo4yhCxan2yEuvr40RLb96wnv2Sp34zAY2mwlQ+BgRXF1Hiq8JFXC2zO9p
    EgQC6Vryawwuu/1zuqpQf9RrCaZ6dRnFdwIVpuafQK1ov/i1P3Ejf8X8/o0UW4T8VKr4Zi
    jEzaM5lkbAGk50KSWFy55CYnI+Zdoq04V7MCRHbn+2H3jvboC+m1gYzoTlFWDte3Ifl7AM
    xDls6sUaHK6nmG2G2RhCuexbHYHcvhbapM9jUJJCet4XGfbpETP5C5S+1sCCkKQrPjRvMv
    vxhNSO4M3CBCvB2s4jCPdd6/Ex7d8mMFBOmI2sCOlxsQAibf4QaRanqkMjLXMsN8jZCb0O
    HK22NLG2vW6fWYMDqDSdv6gZyeSgLtX1fyRwkU3cHf3x6lcxa3+uzOCQHrrwn099v7eVJL
    n0rzo0/DLNNKKtCsbO1HXYRfb2EMC+UBRbNR5Mq1E4WDaClFZuWBKVKCt9JNc0lZVOaxaV
    /EsjN+5xbUGOsT9F+EJJFEND4dAmXRODZqn9O1dleDfwn7/MPFSX7bIf+X3Q
X-ME-Proxy: <xmx:HddYasNjG5QZaXdAbEQbI2b1G_kG6cuUpIO5ieTJ8YA2NEHeIcFghQ>
    <xmx:HddYar4FC8FIbyvPp_OT4SOqdVoT-ztyB6hsWEq3sxa7fORGk_OSpw>
    <xmx:HddYau1tO35KRdqr5ICBKylyW2i5FN1Nff5AXu0n6_dqyFJyJVlz3w>
    <xmx:HddYakz9_fcmI9h4OmY6asQtEgNWSFOdLuhBpPDqoiL_MsuFJaXlmQ>
    <xmx:HddYalb_Mf3xJCzUGW4xDXjNlZUIaKNew94TcHcTnGTzsij7mLWVAD1k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 332FF1820082; Thu, 16 Jul 2026 09:05:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A5QiBhWMDcTZ
Date: Thu, 16 Jul 2026 15:05:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <6dbf2f49-c1b9-448a-909c-7675ffdc928f@app.fastmail.com>
In-Reply-To: <20260716124052.GH1260374@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
 <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
 <20260716124052.GH1260374@google.com>
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 16, 2026, at 14:40, Lee Jones wrote:
> On Tue, 07 Jul 2026, Arnd Bergmann wrote:
>
>> On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
>> > Define a static software node for the UCB1x00 GPIO controller and attach
>> > it to the core MFD device in ucb1x00_probe(). This node will also be
>> > used by the created GPIO chip.
>> >
>> > This allows machine subdrivers (such as Assabet evaluation board
>> > support) to reference the UCB1x00 GPIO controller in property entries
>> > when converting legacy platform data to software nodes, resolving pin
>> > bindings directly via the attached firmware node without relying on
>> > name matching.
>> >
>> > Assisted-by: Antigravity:gemini-3.5-flash
>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> 
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> 
>> Assabet should be going away soon, so it really doesn't
>> matter much.

>> > +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
>> 
>> It does feel a bit counterproductive if you have to add more
>> exported symbols.
 
>> No need for the seperate declaration of the struct tag,
>> you only need this if the first user is in the argument
>> list of a function, but not for a global variable.
>
> Are you planning on fixing these review comments, Dmitry?

Just to clarify, I was not asking for anything to be changed
in this patch, just observing. I'm fine with this version
getting applied as-is. As I said, the file is probably
going away soon, so let's just make sure it's not getting
in the way until then.

     Arnd
