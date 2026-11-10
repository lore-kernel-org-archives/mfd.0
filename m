Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277973;
	b=ZKxtJzREMVbTHTx3wMyxThzYl/z2viGbr80Iihq6XQgAxOcsJmY9nYbAFdeLcCw4j7pm
	 3t4a5r1ts5bNuC1B0sSccFP72Kh5QFDP6N+Sv9ULM+sfazFyPMvYSTxxwfTd94JNHVDpF
	 SPIQX7YeEc5mrWq3zw68xVmufwwKdDaLBTUlFEUisckUyCsDt2CI9SfKh9Mxk3LfRFixg
	 6dhvoh9SQJrvUHoTwbytLZe0rZWsVfXofHF82Q571N1CmJHBcjXzD5oHZFH4XWQ3JGhOc
	 XmDgiaqU8LhbjFCOachJ5nT3KLuRZwUHG8IP5AxHLfNNNxxSSWNR2u0VLTeRjpzHspw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
	b=gsLXrsh/Mm0gAf37Rkx0njPdXo/1dFMUkUyGjaF4h35clLVbfDKZRvPQ9m52pzPFAsvG
	 kLab7obcRY28aeV4WIp3Cm6eQWD7uvCrRSbdfOEZyTZ9E1eQTfzH4ga6ozvb3t1wlpQvC
	 b9qn4x24bu2WE2z+Mv6TRqaM2yEAXwzSLM1oCmXmtHHho4Rq5I3LTx9POLoA1Tlx7kLBs
	 VmCKa+gspmpU3jFlGebPGbC48RmUpocARWE0fYam+/nnDZbPXVkr0Hv8zR2dh29L+X8P/
	 gEynLXREwrDa15ciZSt+t3YetekHj7LQ6AIN5hQBDBG3pfUwh6eLg2lpfYnJ28N5Buw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RinYJ2xq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC3606A32A
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 02:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFC3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RinYJ2xq
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so2080178a12.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 18:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277972; cv=none;
        d=google.com; s=arc-20260327;
        b=H26MVPDwYp/40IqlniPky0VC/3bfK0xuJwOXxj/HaSu8HtSPZxTmwJSfQs/0OV9Gjk
         LO2IWz/Cj7UEWyNNZtvjCA2nnOfMK3S1bYZeTH2Pn1X+m3WDsGq4uWSRUjSSIfvR1j7D
         Lo0h8k5B6AfRO2y7/BKihD6aIdzUIWhkBYwFkA45lsAzD7KHEw9X6zKuwpU26RepcOus
         QL3/qUxDK23wAtZ9RKG4zYETE6/oyiKgUYhLC8pvZ8M+EZCTm4Vwp76rLifRTEAQWCyp
         ngniaouZDsMOSBW/Sql+ihjoxE3eKiqdScze3z7C0kOvKQWzVs1ohVshCCJvscxOqzgh
         ccEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        fh=hPin4gYrlaR6VU7Eg4AStrjzkyKXYAJcvsu8MLkUYdQ=;
        b=RUyyTDUj28qNaSDt9QIXveMXAQpBdalV6TW6COfdORUUq/XqRZEepYnzgnCXh/Tzid
         svxbvOytuQNUqonRg4fREckzem5v0VJYVzBELAoB0TrPGFRE6yFY92QNy6hIH4Q/KRiN
         2aXyktvMLimzG6JomTOTn9lPmu3bgIFmMWmlPCdUiARIJ7V1fy6X3j5PefPiPo9YBrO/
         0swSuOnffUozyhIzwNM12Df6ZqkboH1BINZAdMAtongALm5XHj9eHEefmxzq+9LBc2eX
         tSuJzwbRsOXl2+tCpIsEGoil+TdDLNXUKsSSrl2bY/qiry2b5gW5f+JNu9gw5WOAFapM
         Roxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277972; x=1794882772; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        b=RinYJ2xqo6R+z2KzL69Nc07wr9o1LvLWPH0n1//+wtSM4Y2l+g7h/NNaQmRRDmDsuo
         KFAEcJdZxHpLcpgP7vz/HhqMypNF/S3wPJb844LC28Bz3ZkjbiRYa2McfE51zyO8OhUC
         huD/OemwzF1SW4mvmr2GCCOHunPwnS0AcBIy77Gq6/t/bvI8FQMDQ/4Pd6xk7pK8DH9w
         jPXZVJvuGgfgNLtUAMTdjSlFcXgqYLE+0N+OC68AsS5fojM+YfP2gyu+6+Gn8K3YvA0M
         IicfCBFkj6aDq/pD2m9N3fUJNh8Uw03LKau4h3m//VrcRLn+zT2+tQ1K/ZBuB3DXjAIK
         f8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277972; x=1794882772;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        b=hTZgucfq3vZsSSaNW4vxRUJzpAglIjIRdf+XJsvTkZtuUpWPW6BWZ9LbcCn2ZxgWb2
         0Y8lchDI8zJJ7SvvvBYdiMa+kLk11w2xzcq3a2flfGg8+1lEXsz9nPlB22Ma/L9UFiZR
         O1NdIcIftlvF7H3giCUKqGio/ByGSYHg9WEvOvWgJZxv8JLuFIFdkK+4OIcpXBVQHErr
         9AM+cb1xfDSZxiU76i8u+xcb5utVOtOFouSWY47aJWRffVBVphQuBgMIxlr/vyRrT9fc
         rPxeq6/ZZRBEQpfbX6GdT2UKgWjvkltfXR/4K7C4I+V8/1Ar1+N0ACa2VvgApzFMT3Gg
         iZmw==
X-Forwarded-Encrypted: i=1; AL+hErFCD4uxFOHvcxttaVT/CDHSGWfjSVDIRvuFeA3CbLUVneAJqauYHQZgfzYVPvvGcveq0GQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Y0RIMVabpgdJgUkH1RfhSinPO/pZEjxUFk52bpsb+5LhGeaqw
	aPiI88CPsvmVlKo4uNo5/QjTqtOoYQ3+lRXzgMdSJs/6OuusXcjxTG7/akGmVGalZ/YBp/RoASp
	mfWCTni2jk30vtxTuWzgPznRthKQkTw==
X-Gm-Gg: AYBFou3tgG+fK82vhf/sypPsIy1bi3yedszASXO2x/H0V0GcYMvGg0+KuV6NramI7Tg
	a1DM4eqndp1aQHrRAVf7xMczgRpKhwJd77aSAMlB24J7bLHUhLGCxAX7+HEdlAFWiLZe4va4S8J
	ul6EFWjsKxe/Y5QbMh5CFFj4HvXE+RaA40oSh39TqtLzGtvmoMRAKzXu/v4PxsyhlAshH0U4ahi
	IHH0YY0NF72rON1zFzoOmWiKwopJPPAQE1Jt/yQi9E0BBUid1r34tECc9AhFyxx3cEiHtWzhzVT
	QOC4E5gb7AC9naSdM5JzJ54VLkyUmjbRAbZvAupUxHEbvMmYap2vurmK4X7/6isjT7hxQYCA6TT
	ljQg7A3BPJfnB/lkgQBbnHEdB/ZibIi+WAGuyYWvxxXP9Z2UdYRRsjN5VG2LwmLzoIJoozYXQIm
	oQL3i7+QES+lGfxFLY9gqYGy+KF248QsG8IF2K3z7speBh
X-Received: by 2002:a05:6402:a507:10b0:6b1:8818:1090 with SMTP id
 4fb4d7f45d1cf-6b7568dc1e7mr684976a12.22.1794277971764; Mon, 09 Nov 2026
 18:32:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 02:32:49 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Tue, 10 Nov 2026 02:32:49 +0000
X-Gm-Features: AclHuK8AIkgNRXamUPSojUGsIPAwgEr26dHrd-qWTZA7kFbE804fLktH5iFVef4
Message-ID: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
Subject: [PATCH v2 0/2] mfd: wm831x: Fix IRQ mapping and cleanup
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Ijae Kim <ae878000@gmail.com>, 
	patches@opensource.cirrus.com, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee and Dmitry,

This series fixes WM831x IRQ resource mismatches and follows Dmitry's
request for managed onkey IRQ/work cleanup and MFD-provided mapped IRQs.
The provider and consumers are converted together to keep their IRQ
resources consistent.

Changes since v1:
- Use managed IRQ/work cleanup instead of storing the onkey IRQ.
- Move IRQ mapping into MFD and update all platform consumers.
- Reject failed mappings and unwind consumers before removing the domain.
- Retain polling for release detection; the chip only interrupts on assertion.
- Drop the previous Reviewed-by tag because the implementation changed
  substantially.

Compile-tested with LLVM, W=1 (arm64), for all 11 changed C objects.
No hardware testing.

Previous discussion:
https://lore.kernel.org/r/atJycIEnUZKVdTjW@google.com

Thanks,
Myeonghun
