Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09930F523
	for <mfd@lists.linux.dev>; Fri, 19 Jun 2026 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854276; cv=pass; b=hKWKaLHwU8O3wiQN/thIQdfNLyWsAIiC5DESIuelb0lkdZW18CD3q1U7YBmF/mH2v5KNWVlHn3M7jISgPOOLrN7Qdwq7cZkm3n9mSlH/zj5RSwshpsPK8SVwTdl+ZS1daAwNZpyHbICcMZeipnVC472bZzn/uYexh/ubhmHLFuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854276; c=relaxed/simple;
	bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Akq6GYs1aoayDecxuKC1XKm08vy+vZXhe9eZs5TWU14pDrdwx5ds01mClAY9m7ugj3bLWBgUjOb1be5w5COC0BOkjWHJq0/gEWswy11ntPQ2/i22Wd9nA0nVCB7/QzBs63VDP/r2VcMlYiF08Jo1AnbE+pHEsIGCOmYZVOfdPVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FsWlPcrM; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FsWlPcrM"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-441080fd7b9so1335318fac.3
        for <mfd@lists.linux.dev>; Fri, 19 Jun 2026 00:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854273; cv=none;
        d=google.com; s=arc-20240605;
        b=aRudM4HA/ckrETt1IlQeeVl4fVAH95oo3WVkejno0Sv2IiAFD7QpgLeGFKUdD0Apio
         WANnkVl4+M1zzXx3++F6EJoypPbMgAyNstultDk6sVQkBrl7HPIp3o2ZRWpcz/DRnprg
         yDnULlHq9PZuCcNlC+AMxU0VzRlLTCCL2+4PlWrz3YtmA467o+FS/1BN5FFCPg5pGJQ2
         yBGNBCoEuMzF6g6Azs2jEnmln9v/tkA9jOcmxtYPP3tsutNBQdsAykseUyPl6kvxAnkY
         XcLpYrS1hv8042sc0ezeS2Zsl74CJBG/5uxFuUeT3fPk8fwRlYQdL//9sY0QY49Tim1C
         dPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        fh=n91YrmvvvMHYn6MDknuvX828u24G/TRCSncu9CFOfjg=;
        b=gmxxr+6k9oxouw479Bw68l9xK15xcAOWmu93BHVcFy8UHxrc4FaNmj16X+q4bnJK1i
         omaE30Ab4pzEziHlyyJoVDTKTgnu1i0SrmqQWitrAkYbYKtxqEoELqHJRx/NqY/e7Mf8
         6aRLsHFYPApgpBuYy1ljxK+rJJs/a2cT+mghaK2PbBe1EG4GemTLTQ7PxRa39UXZE3cB
         4X1bi/0dJ7Z4LHheJJJwojNZItaHP3Isb5+qlRiK2QAnMjg2zecqKfY0lTuuLwKEwPLc
         /3cMxA8DRFWgncQ6YaMyXhK1yhTHPfH8jaZar97DliCydQ6mzZc0AuO9u8PFw+QvyeJp
         2dug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781854273; x=1782459073; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        b=FsWlPcrMU/68pjfpF/HC7kxIeDugYQ2Nje5NA8KRwhzDsDk5y76tkXe1D5jm9UgLj5
         8LA3Cz8+yBQLVshIgSgiYx9Osg0T5yx5SxiLT2rkHOLfhCRQp04OiFJj+TpNcsYTGMlH
         2ZudTtvz037LT1MGDNbdaRSPZlaykNdELOw6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854273; x=1782459073;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        b=lubEccINGSikptbHZaFWY16yZMuF9jyx9yMfO5VB9zHIFM49OjsC+ZzZfz35LEjOVO
         HCPDo/W63DR6vyluN3dNiQqMvMG7Xfp2E3nmKmC0sD3GNaKcyhP1xLczLx9fDB00WxSJ
         4gMII8ewzTnoX92ydzwXG0Z1vAYEN5J/mdsEoKKZaYrTc+ZLc+PQZfZWX+hDOw9ieiE0
         kpPXtbB5KVJMLcwkvbvIDyegud7u6Usea2ego8xxsPkdLng/Dm9WXaUWSpq7SgCyANHG
         6GWEvVgiQXlVv7U3AvGPrnY2FfG2t9UosJpgg0FgVFHJUVgMWiV4gRsOAqeEjy4+t5dq
         /GKQ==
X-Gm-Message-State: AOJu0YxNwk23AFUcuRF3JnhUVpslOPjDvooJgv16pCf9nQikn2+4oO9C
	tIyoUnNjaTB0swUreARFq49TWbdBJx9AxldTusaCvEHALLCwf4qTgGeLCaHlrmlsj9MDYwzked3
	4XzsIecvd2skx1TIIvuCCzZU/uZDom2kE4HsNAX8D7LVFqi5n9tNN
X-Gm-Gg: AfdE7cm8b2O5TfpZ54zBNgUo+BFycqYDksp9kLxUAr8APiGE7iK33H2qMZg62PxaNqY
	6L1edRn/zWQ4qv0/vUY52BwiOUDhKXRuLlTySc7H5dMhcbjodt1hL7QMvQU91z41reUzYye0NLP
	wiomU2DVno9vLpknWrSE9w0N7hGo7pm5TgUEg9iPTlPfTf3CAOJzFuxLM5EfkkWOLgMPnbZF+0x
	5wW5SaGFhjI8hz0Q9jMGr+rULc8Bl/aE0eyLJxQWHmGwuWke6CqRu0X6I/iyn/q5Qq4IV8seQap
	ccTp0F7sSwI22aCFlyS+A/dZQy4=
X-Received: by 2002:a05:6808:6a87:b0:489:4412:50a8 with SMTP id
 5614622812f47-4896abdc690mr2230914b6e.25.1781854273320; Fri, 19 Jun 2026
 00:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Fri, 19 Jun 2026 15:31:01 +0800
X-Gm-Features: AVVi8CepdCpeG2MDof5UcpO9SepSUze8mhMa3jLOC4feOW0aRqW0J_sWkW_SA3A
Message-ID: <CAKkv+gysTq=-PY=Fk0sKyCgGkQ37TaoVivcn+54D8QDWuoBxYw@mail.gmail.com>
Subject: test
To: mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

test
Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
