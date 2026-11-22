Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795309442;
	b=g6bIfDSbwKK7AQr9f6J+JyEvghb0b2wbvs5Moqa11ULBxWzd4VBvUDGNwOdb3tM3n72H
	 3zic+xiUcVf/uvVCGYOqe/GeD3K3DqmbPi3aIPZ1Ng5rgeLv6eH+0DGcr5Po2NOwMnTHa
	 oi7lmU0HXGXzNz2a0l7/x2P+mC7ocd4jYEESgUYkpLZkQiDQ84PbxWGVXClCr5X4ST+Pr
	 QUajHb3LDFKyFrJJaeWOs6kQjPWUxAqqooQRuK6CZIiEWhh3sl63Iba4cov/rImhAFXxV
	 xwrWPU+1vwzk30hT/9sbAVOKC/neJNMqWQkAyiElBPgVI/Zuhn//JGMXfTzhEz4JNyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795309442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
	b=ouLAPTRorTOA6Mjo6M1FXcINuMHPKSjIRuRsq7ibuwK8bxAR+2Nxynd438fKsJjZ1Wgm
	 vvybmTsUBjrXh5Pf7c6VPoo9pXLRG6bnE8c9ZoX80wc1RGbeOVgqfD25t/cWZaEgW9+Ed
	 kxDkLYIdLs5tID29CtO1iZ0GdaSisCJooDxNT2iDnruwpoAuYTn8Hje7eeXjiOs/QEaS9
	 WCLMaSsJ8hecAJkIEaAPNcb3nsEUF3NrlBeO/sCpEtRluQh3sqt59zWeBRvpTNJXoRPvk
	 gaStJZX8WkaPLHUvcuTOdBMSpf5mXawERLlRlKhSmTfaIFkinhJdbXS1E/ar4QfD8oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b="phwjd/yL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B403606A332
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 01:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B403606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=phwjd/yL
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ada81853so2381326c88.0
        for <mfd@lists.linux.dev>; Sat, 21 Nov 2026 17:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795309440; cv=none;
        d=google.com; s=arc-20260327;
        b=HGTe2wgPkmv+a3XMD99BXFDK8Rfh0ZBQklrDUo1p4NU2jYCxs/k54U54SU6m9B/aGD
         Cy7/6U2Hit/s05D6tz/LUa8krmQyauJjiAnCLzQcEZsty5d/hr2mX+5lagBNMqTKrugY
         bsGjkgizaEWbYvSs9/AOC+ksPZjRdWDqh3iYtCNtmhM7KKcddbYC4Q0sGrz8da0cQFrj
         /olJkV0LROF5+M8se0S91LKdoxrhMaUQmdxfVjphpNGE6l+sU1u7CzcoP9Mwbd0mBUOj
         Yqg+KegP9kTYUctnoy5d9hXbHqZ6eVQcp4OjzAzDed/cJFT7YAI1+XZIAEV+IjaoijYN
         7NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        fh=3vvqaMVkhGK6v/K3gj9M8VnFrYoTPpIrnFikb/fgy+4=;
        b=Biq7BRUIyc8PcKwWSmcIJCMv7mq6CAZevVgnwYa2Mk4ip6SLNlQjhtkdfWryWxMEXs
         z7kp7fJvticR5PdstZFK5HQSghXtXjsH9AcEjV4j4Ma9nYfJMD4aY39E/+R8LekseEwp
         SlE+eraEfkzIKgn26e2PaHHwIZfnMohFM0OKyTNUBuNBR9hcbHTpr6jewEIBc+gIyQNQ
         ceSmNV+4M0HBIQLtoyRF1HG4Dt5n/cIbvHXuH4u6JEzRou1XFBHtSfcdHvKuEgFUX4b7
         JBpi6x04vosnmuEE6pnaZsOZCcWUhaDFwSqihnNUEI/cxeC4EpGRRjO5NOjbNh2QpPxQ
         dEYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795309440; x=1795914240; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=phwjd/yLOn6SWEjWL+GHLPy1wM4epFNCDsuoPWBod6NT9CYqO1Cft/lW2kYCCI+bVb
         hcYAV8nppGB2SE9C7vATQqAyYwBVMliXIJmxDrykGnR61f6+pnEWBQ7RsUAUWWB0j4Mg
         Ox33tPfgU9Q1HLrwdltxQHT7wzEbPFhWTcUag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795309440; x=1795914240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=YAVrVPTP+cIUKWF2Ae9oK9gptOcWHeBtoLH+H763KXL+sXwS1OvyGi9dNLu9Zx1Pb7
         1tTxWOOPI414jZAn0C9xh4IS/CqMGN0PJlvrT4lm7owPv9MKDxU6OT7SyX3tK/N5CUq1
         M3HW56RXRKPASTI9BshR5NtZgaI94yrLHP8oRPSDyJR1jo5eAj8ad/FGz28k85C8ECZa
         7TTLXBZpUW/jknU6tztqF3Bu0Fvty4gjLYAOXhjJ3Ls9WzplZYaFmVtPoNDc4sbFQ84v
         M/K5SxtWHTwOa+peJohjOqaZzkVpcGtdfQpLunFi1Np6jBy3uXpKAt86iMNXXCaoKT2p
         PB+Q==
X-Forwarded-Encrypted: i=1; AL+hErHMVuO49sE0BUUva4BI5UI3HeB64uy7UiEorU0QP+IUv+hx6zFmgEwUowrkShqKtT7lYPU=@lists.linux.dev
X-Gm-Message-State: APuU4Z95eK0REF/mYi/Rw4y7clsiYpgh7GkXCppmtUZPBzPMU0DgOPpu
	NBhNVkdRMHC8cD1AaT8mFTH0hRUbXOt+k/3Me6Zj0bF5+4f6Qy2PxH+HwmZnGUv5q11XqeXUPMP
	q5j+0e/dIj9ehjgSSgpRgT54jqLWe0pvc7wHtjyNE6A==
X-Gm-Gg: AZFdTZe6RsFKmNWr9y3p1mjvbMiQWo1NHeglQL5pX1UO3/jawbDPiLtUu3/3twrwGia
	KNnPzk7nFptThMb1zyYVcv9Uj4s3Dz/wXMOKqIO5TYIQf4lTIDEiGbIlHn769+WPhIev00c4jTl
	Jj2XHEHJ/NDXOTxCM217YOXpOfbWzj5xKYqCqMQWvHqjxaVNECfu9sb4tENUlOf4cxdYOphI5eA
	IYRcLT4SJwiJPfigDidV1nj0YLlp71HHIkkip8uqcPPULzoJkrsNGXLcVSlgpKusy2Fd+aUp5I2
	MwNTv8SBntd9uudtLlH3YbtVqnx22X8moVZhr+kt9JO69aj3MIp+XPhVRnIDa9uW/Ka7T9pa867
	Ri3V4Mh4g4Kl+RffF9POK7NmwxRuDH/7y9Y8jPYA=
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id
 a92af1059eb24-1b56f87ab60mr41806c88.16.1795309440060; Sat, 21 Nov 2026
 17:04:00 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111163735.227286-1-p.pisati@gmail.com>
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 22 Nov 2026 10:03:48 +0900
X-Gm-Features: Aa3M54q1ImzjAY62LMRYJIQ2A3YvuU8mR98bZ0JQppFgLr97xa3DaAxEG-GBzXM
Message-ID: <CAFr9PXm9+gn0Gz47TU+PG7LexCYWWrU915BLcLAHg8GSsEDDeg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] zorro: add a CS-Lab Warp 1260 MFD
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Paolo

On Thu, 12 Nov 2026 at 01:41, Paolo Pisati <p.pisati@gmail.com> wrote:
>
> The CS-Lab Warp 1260 is an A1200 trapdoor multifunction accelerator: it
> contains a 68060, an FPGA, an ARM co-processor and several sub-devices
> hanging off them. The 68k drives the IDE interface and the RTG display
> controller directly, through the FPGA; the ARM owns most of the rest -
> USB, SD card, WiFi, audio, the Kickstart slots, the CPU clock, fan
> control and the board telemetry - and the 68k reaches it through a
> dual-port RAM mailbox.

I can't test your patches (I wish I could but I only have a 060 + G3 +
Radeon hd 2400 A4000 ;)).
But since you have an 060 could you maybe test these for me:
https://lore.kernel.org/linux-m68k/20261119123558.2108296-1-daniel@0x0f.com/T/#m42ec8c1fe97b64b22f9cfc8d7ce753937bdbab1a

I also have a fix for a small performance issue in 060 only kernels
which I'll send next if someone else can test.

Thanks,

Daniel
