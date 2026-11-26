Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699836;
	b=G+gs/ultQ6opU23//PtrFggadelxOSd+XXpgVbDgsmTaPeQFG5Qgcuz/bQMxII3WoUA2
	 4nym5HXoiOrvG+KC0bLRI1HN01jqyCmkGYix/a2tUqVI2UyCIeccQPsyFK+eqLyyCefz5
	 upcLTFrMRp9j1Gho+NcJjkPPOPJ4B0zcL0xV9aGfdg32wqr1mpToOWRZtlr5cyREp/6HP
	 N8Gb5Ru1mYudtevF+o5H7O/8bXagmkaPNiX6ZFnGe0k+Fv58/MGw2OCAh5wsktHWNAygE
	 1pVoK6w+fWatQy9KbO/Z5mx0gzU1jWdK9fAR5/3SBBxbVwv/h5f1UYp60nSP8fXqrpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
	b=YqLUOnM9EsXWpMg6N/Cvxg02PYZialoHXorjGYSCoalCKJX31Q+olold6wO5AAlvHFGM
	 22pc/2pU/UvpYPWhGfn+JT5MJmuFObRS2POkjOg2afqA8nzOtrmwlsYRVWnNmBU7Xid85
	 jmt0+bWMYc671gmIu6sFGR9SdIzMRIcq/7evoLjkKpevGrgLX8+uFo2Fagyoi00m2IxJ/
	 Uw5qzlzVvu2z9w7ytpp8LKosNOeayXzHG8fAQRv10TQXpzTPYzTgYPR0277gMlOTGcnVv
	 qh9LuOYrQXwrG5uz9dRjoVvJyJD8uo1cB+99bhKw0FFePdL4w++94UBaVo0/h9CkMsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPI3UKxj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F0606A321
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 13:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B5F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPI3UKxj
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386bd881d39so6951762eec.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 05:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699835; cv=none;
        d=google.com; s=arc-20260327;
        b=DGU7pPHe2yDCUNz2Fg0BT3Ysu0QQNaLVMM6L1g98AulQ6CMg/DapnFJAPOAKPyssz2
         snQSxMJYK0U+fcWyCIOAqUESzAt6ahlB8yMCuXpUHlFPR/RkEeBkxs2iQgtRS1+uOe2w
         SPDfacKYe6DgUSyOLG0MipDmnoWVU4JY80qRFSWN9VlsZF0cv0O//3vJQYebagif92MR
         bpsVsZducI8mnzRTaKEGjutUb0qOu9gqZt7v9X2Bw4mwNqBeo134Ha3Ych4CJR4Kep7W
         /vV+XV+SDHieM3916NVnNhZ7bCNdMgkRTaag4gYtEuv8tJBAnpH7yKuMkv4s20vMoouD
         MfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        fh=WF9a4aQoCVLwuS7WXnpIwzOTQ/74gr1e74Qgz18hs/8=;
        b=d1nVt+bi8INCEobBN5PAPEl+lFDHIH0lZOdszivOyrh4SeEdKlyjQFZqnFxJhA5jTF
         eReP6fWTz/Iib7JSo/BE6XVBN4tMwwbZDxzCZx9Fjwe6J/kn9rdc4KX9EsX3iBh6J2Xf
         aCyFyn2ZZdx72yWrdXaAPysu1KvGpSXvIBubPByNA0593YCDmHHbW+0r3dDkLrCW1szw
         IPyvLH6ttJ8aWGlto3V8pwDfikrjYoXMMkgeWgFQTRuOIikLXgFITHeH3TM59Kcjzb3L
         qTe1UNXJZwMeIebwTnLq/rRIguFJcEOOs/iubiGQAVxNwajLcZToX0l7UXHU3m7OJ4Qb
         M2/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699835; x=1796304635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=YPI3UKxjZhFfC58td1/6jydZmcGvQNiaiRaDxIq2Z+CxZHqJTzSEyTbgHBRsnuSNk+
         hI6uo7R3iEYwVvKUbeSINJUVQgCLdLiEtITU+zP53HfA4D1KTs5FUl1Z6uGZX2/pOk9Z
         QREUnl2PmapOQbfSo7f17ZQ36FntDWoqT6Lm+Rnqx9/qZGSd+Qj5vOgdEp5qL5wuAdYN
         bc5JOohY7cJ9xzzxNsV4NHnX2Fd8hcluOg22VW09+4Ojnwegzs1jdvxNFvTFdRjtFUTc
         ltt4hfWc89kF09YrQzcRXunk2zVHINlaAy+IduWr1F9pb8aZAbPtJxrpSOEfR2Kj1UaY
         9K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699835; x=1796304635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=zsjx2DrUBzCIBVqE4q+M0LbI1qUjZ1bDYIrJe7YwV95zZbgfKprS0thIohnR5v+jjH
         +qRTGIIuCaE7dPS2M6hHeCGI0nsTxdyzZn76STlvX1u0ZeatvRgsNz8Cjd4036m02V25
         cG5FB+bJdvD9Ph3D4dxHOnc2ThabvsQzf/nTSdYwqWc0HZA4zEADFeNWQzAJXccz1iwf
         VGrPEMiCeU7K8qrKiR2iyVxLQyjmNg057JDM13woO8pKsoTUVTxY9Jt5ZSD3Kklvrw1O
         2cb3J2EtHTR+gwCIIWJd/aijEwN6T7TCJTwE7rSCLdoBa/yqU1WwBfAujfbO4lDoSr0v
         zl+A==
X-Forwarded-Encrypted: i=1; AL+hErF7wx/E7p3F/WZ7jMtgLcov5VXTVCZq/p18W/+q42BAzwfrRj/aQZvgaLWNgQr3RK2WuOE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/5KnnJAJ6l3P4NqTaY9vj5w+IC4csbkgOnGQ2UhmO9v0nYg7Ka
	w7YntkAo4XPg0Ev1yHf2GJO7jSrwVlIMMjkDUzMIC44/v5IdbCKDTozphIxCVBIh2fczHzJxULC
	rDxGlvMXbFxGxuVZ507wo4BVB9ohEf+w=
X-Gm-Gg: AZFdTZdkTHDit9hs/8jKQb91U2HnKVhOrrz5uGnmoqcvDtbIrghx1j72RIHecjQSqrR
	AtHv8plf8Kdmz4BT2O5piyY+xn/saIrL5wAL1Czvf3cjkDiEVBb9tpJDrO/vNkD5Z4vssUEwRPh
	RkPzwTxZW8Ga0MKT5u7kG5qTNX/1WUzt1WG3aoSNptBuMHUkzGlWjc7PQ4fotZ8tQq/Mjh+OblF
	jxDZQR03Xw3o6wVmWaZU2x4ixzFQ7lZHebBfaZ1uU+2BwGTLKWAm6fZePo+dR9J0S1fc9+np9ky
	kg9NS/P+2Uh/cgpDzS6cVDgh6hOSn2Lo6jd3rS7EmUSce2MwdxvOQ/sLoiKcC02oljE2MNSv8Tx
	/5fwJ0z0RWCuUs8JorqrupH2JTN0rFwNE+E1ukbFTfUGAUHqx67D48SXTSQE5FW4PnzMAh2n267
	xw6Uf/RI8Buc2g+VzhYuvDodcDR3VvGUTCMKd2pqTo7/fGj+6Q6K4=
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id
 5a478bee46e88-386da66762cmr2781680eec.28.1795699835188; Thu, 26 Nov 2026
 05:30:35 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115090520.102216-1-clamor95@gmail.com> <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk> <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
 <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
In-Reply-To: <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 15:30:22 +0200
X-Gm-Features: Aa3M54phpO9TY-BjFhMXHRwC2_FlICHLesKqjIioZHRgOyOaeZaLBv9530oQbas
Message-ID: <CAPVz0n3tpcEteSfU+51_FeJaYYMwz522h968nWHSw2gz6+336g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:2=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 12:29:36PM +0000, Lee Jones wrote:
> > On Sun, 15 Nov 2026, Mark Brown wrote:
> >
> > > On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > > > The Maxim MAX8907 PMIC supports a single LED; document it.
> > >
> > > Acked-by: Mark Brown <broonie@kernel.org>
> >
> > You should just apply this, I think.
>
> Well, it doesn't apply so...  :/

Obviously, Lee did not pick up
https://lore.kernel.org/lkml/20261123150224.199601-1-clamor95@gmail.com/
