Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496868;
	b=hdnO0cyc8E9KW4cQWNM3kvceUHyT9lBkpnx1yZ+Iokbh2bkdw4NAHRXQ7AoLok3SlHGj
	 jTJOkvjVzokKWJ4oLMckgsvYcjhS6a/ALoa7nPTY5gay6vPWTzYmtZxwhTEJMebBvUhQC
	 kkS74UYmQlW6fntnOv924OeUZxE8pudI33Y7S4zUWVu/ai29oPXsRFEmwSnBkSZEY+u01
	 CIpysIMyFB+JNgHTHsEtJQ29tzb/3ovUoWP24fyzzz2SLklNDtczA0xR2iUm0ziD00RvH
	 ptuuF4M624mB+9UuxaPoQf9nbWewNqPWD9THeS1NQyM+o1CbrcyNWaUMi6+4c2q3ryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
	b=yTBZ+9sOJYSXM6uc3k1XZdy3w14M077NRozJsG/lbf8oJn4OfKABOPU1+rwvEMOK+DNY
	 aNUzjtUvYWMhq9+j26ijO31m6pUVZk+ihG4wrCbszdH3eNFN+RM+sW+ATLtxlwvb2W4p5
	 +rYIPpVqNieRMpPIV2Jwn4wQHHeHTqt9ZGgZkWwHIwHSorFNF0p0Q47RtTHwXl642Ln1g
	 uvztfNLtmOMfxG42cFoGEtY0K3owLLLpfcqeeT1QKZnRRMdLbX42AKrAcDm/JY94FA5k1
	 V3sBkCV4xppo8UKzSUgrlHZ806BJZdS4mcXBakMHEE5YGIVrwmCQB68xNr/RxnR4BVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLaohdxj;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9D60A6F56
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 15:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF9D60A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLaohdxj
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5066da8aa1so287259066b.3
        for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496867; x=1795101667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
        b=XLaohdxjOQ3/lcPQR1i4Uwa03i43Vn/6U5NWbPJErkbzrfI5XdKi4RqLuqxJiZVGEj
         SB5ICuobTMxWwpk/WA759OhjiVYYUDerESbCary2PsW4wBCQaKYNMwyP9jYcBITXEmXK
         UiDpp++p4YnL71FGxJVvFdRFiDTQndPwtR1saEC5QYrmbpQqE2bybMgo2k2YYznngGFe
         t0+aaeZrxVWYaIitu5GmuPM7YJI7UWvDT/ujb81GG7W/EO2nJz0DtVhZ1oVJe+T4chqK
         LA1Na4uxyDyRDD8FAOPO/zJp/XAy13ZeXXUtOpIMQa15RhoKp6gQ+WsuJR5RyHrByKvF
         uMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496867; x=1795101667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
        b=koZ2quVrxm4nS7CMZwZJ8bj0pd5EdMVS9eNix9JMPnGGoIAOVYANMQUDQAlVmRsm6X
         hsUafIM2luXlcagjOOYefcEmu40N6vXl2gmOzCoNpcKCKgtuRwdZ8SZWOGUYcPQdWqRs
         MpTy8t5CiGjGm0i/Pfpv8uf8DjEFaWb6KUUX5OMCR/jnVL/9V+zimrilFzlGXH8JQ82E
         obnjaThE6M0ABE5ZyWBQpJm6CGihKcJTUxVcNjJso8bELQ+YmfWtaAZlBTFCzI7T8u6g
         qvInBF7EqIuv1UPSdbJWwG7qmNXbWMGj4GztxuMK1G4bfzff6uSxA9v/JK6y9kcGih1R
         UjXQ==
X-Forwarded-Encrypted: i=1; AL+hErGtv3BcQQ+MkzSAvk1OpKzWPoVLkLsBAo7slDBfIQxG/byvZLm/mBqFY2QEytcymujeexg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9as+40TnvdPn80tnuGv7NN5g0kEavi5J0ZZh6/5+n3FozPpNuE
	QLgQLIhsuleKEWH9V+mtEPmDFDO8iks6cIK54tkesbGfuu45udP61eRp
X-Gm-Gg: AYBFou0YhSFvJmkd18+iU13OJm39sHdmy3WK+FmGmtlsz4zk1R+W7a7pi0JFAQEjOHZ
	ZV5ILGG3gkVzE0SxToLmUAo4iDsETht92t2tnqxDKjsMn4zYTvYuZLedA2PK+3PbGm/eZug2sPK
	w5koV3i2Z0qpa3/fvan1DuGDru6paZ8sdquBwsUZBNbBUDUH+BzDB/Sd51nuM/Dcc/TVDwcnw/8
	p8AZ07SYXEN7NfKQwfGwBh04DTIWvJaJ1tAz1eTc/k2VoL4KUq4bh6gQtaLfwTL5KtmizrxRlPl
	elInr5088xVmfEG302A5YPv1Jd6x2jkCUi3mk8l5OmBj1DwtQAVkdvkse9hwzwmXvM7k0XqNYVD
	RubpiTWQ89JNYtbqjkpsmFGtTNrpqid47V/r35vsj2AiJPOnbJtypisofLoN2JdUaUOtbJzyyEh
	+aZ4K1VmuAmynkba4oQ8OR3AX+Evv59YtBbbYSFyltZN++y5WKhck1xg/96VKCYs3HqcHFguqL/
	uLr2uw09ys81DYCx3WtZ0cZ8w2iXJdkBY+toLbveeSgU4zoBKPmh5qVHWx4KOxQusWA4WS7JHqW
	hHpkaUNMUnvG4sdnGYzScnzi/OO3bLidZZct8MSH093FPTZwoqrA+VgjLRlXw3S8KNHQanVUsAc
	V/5OSjWObFOti
X-Received: by 2002:a17:907:3f11:b0:c4d:212a:192a with SMTP id a640c23a62f3a-c5066db88a8mr468170266b.48.1794496866215;
        Thu, 12 Nov 2026 07:21:06 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:5984:fa71:7b11:41c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm16385724f8f.30.2026.11.12.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:21:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:21:04 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Paolo Pisati <p.pisati@gmail.com>, 
	linux-ide@vger.kernel.org, mfd@lists.linux.dev, dlemoal@kernel.org, cassel@kernel.org
Subject: Re: [PATCH v1 1/7] zorro: warp mfd: add the CS-Lab Warp
 multifunction parent
Message-ID: <wxsfjhxzk4zrmaf3ykjgwj6sulyylqfak24xhrwa3pqroxtwgw@w66gfa7yi7jb>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-2-p.pisati@gmail.com>
 <sashiko-outbox-209365@kernel.org>
 <20261111180442.GE6323@joneslee-macbookpro.roam.internal>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111180442.GE6323@joneslee-macbookpro.roam.internal>

On Wed, Nov 11, 2026 at 06:04:42PM +0000, Lee Jones wrote:
> On Wed, 11 Nov 2026, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 4 potential
> > issues to consider:
> > - [Low] mfd: warp_mfd_probe() places new MFD core driver in
> >   drivers/zorro/
> > - [Low] mfd: warp_mfd_driver hard-codes mfd in names and uses wrong
> >   subject prefix
> > - [Low] mfd: warp_mfd_cells registers only a single child cell and
> >   Kconfig mismatches code
> > - [Low] mfd: warp_mfd_probe() passes z->dev.id instead of
> >   PLATFORM_DEVID_AUTO
> 
> All of these are hard blockers.
> 
> Why are you adding a whole new subsystem for your device?

No hard reason: I took inspiration from Geert's Zorro MFD experiments[1], hence the
weird location.

> 
> This clearly lives in drivers/mfd.

Ack, I'll address Sashiko's comments and i'll resubmit.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?id=0417ac04d4357f5c1bd2bd43bb188624a85149f5
-- 
bye,
p.
