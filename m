Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798573D34BB
	for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271551; cv=pass; b=qwjRrVg/SSQf/Tq5Mmip9A+ZfZn0tmJyEWMbWX3Fon+gLrzyWmawq4ee2gdH4Yh1zxSGTSVlftBHlqhT+v3p5YgleAr4bv4ldSvOrtEd00o/zRfabOWL/TYvJCBmenFzEm6KMwPdIni4wdsa9xP9a+4QGEIJMwlBHMreYM0A5aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271551; c=relaxed/simple;
	bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJGMm8w+SuY2DA8ixajBNhOtwF/M4mKkkW1Fzn48+qgPO+lHSjIHAQdPq56NfcT1K/vkODQfobYSwe1oL2i+JskTk8RwbZPpy8aYytOI7S/dULeUavubVvIMmZn4yX7649lRVgYmLybo4fpeIEWKJ3UhS2wEafdK/eQdT312YBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UD2vYv8A; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD2vYv8A"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5218927884fso1246171cf.3
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 23:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271549; cv=none;
        d=google.com; s=arc-20260327;
        b=HV5fb0e8UEyHrPsZswvA8rL50qPspbrmb7ugp00EpdoBEob0u87tD7Hnw5cZtwf04e
         Spf/nkhYFsGSUOWOkFSUUm+LtiMwAf3VNzcIPzBUii8TDLHqbkL9QrF3FOLN11A6XK4z
         lF0aTChBoiefFxvUbReCe+9+hPzDV0gAcStBZXP02PIGGC8brkuFeF8HykHL2S1A5Cwb
         r9lxQXzkbIgfiEo0DaXImYBIR/2A5lDy6HhLKpfAV8XULEPN3sdFzKO9nHqb3yJQm/jv
         dL25e8QKcZimGqW+uzocdBayXOCHNhAjaBq+2FnzrgVRYeM16xtV+CjbO0qkEXiVJYwD
         6enQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        fh=lUMQWPkEZ6AcKIyZSvVSOYy9u0mvoyhr4Ztb1hNfA7U=;
        b=cnBJEq3iZjzT56NFwve8zOyn+HAeN/tPLoHExHEX5/SJvYyZNOIZTZLKqCY7Msdz0o
         sDi42Ag83npXHxDRn9cPPcsL3pnkFQcax5H4yvTIMex/TDKT90dPt01rZyHenXmqfxU3
         Pl6MvNeaBUAa2fu/W/qZFLyFYX1rlMV/3aeptCYMMHlJz9EoZaY8ypUdiRivuNh8xkjW
         mtYhHGKUZ+QOcdLjpeXn9WwaF2+ZoB/NOxp2iXv2xwgJI0eilCvhV/JM97kN1AT2FUO7
         u4z3YX+PiamtMe8ArauuZ7veNF1J206j66t0KeBv0/PC8ebP8G6VnpTIJaLOiy29Ctur
         pTGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271549; x=1784876349; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=UD2vYv8AOvK+Ot+kpqMFk52d+emgsHfxZ2J+H+/UyPy8VqjREwXpTSqVtZX3TAZvJ+
         k9cE5XdYRJsryYbDauM68uDR9SR1YdtGBigDbfI0PsPvUguYLeBf4XWWlIQHvgB/2/PT
         2Hecfoox+hGZQ9qUWRxNLuMCk54yMJqPd2lr6eOXuOc1scNCfQMQhTTy/wtz4cTEoG/S
         QBWrBVkRq3vWU4cH5tDXTGu9glniKvLQXAMWElIzhFaKm4uYmDUlx8xKnfRy9/374z/T
         9YN++qcJ7k/HKWFmkhe6bTGNrcz4XMsfC5TOTbel51t9FJWhiw5Gbg0LdOKUCEHg37UN
         Hvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271549; x=1784876349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=nlo2rn+44jSvpxsqryj2z/d14mliaZvKvClVPH6HwTf72fhQSILQ4A2qDoaEkiLpWC
         Vn8v6srRSyP8vSilu5mrITH19fUh2ZQ05lme3wyP3L63nbt2M4dMgfWLDlKsDpGZbI8d
         5gXJvsMIX2lx/KsNJYKM4Cx4O0ULTNdypsud9aALu7D1eiu7ythOWOhxTGfnl6KipbU9
         ZjyPOANBTvRnW6HU4w+u4RFhft9RfsqCTcV+IHT8Xci2XkoyoSnv4vn1RZ7Eo4OBuVks
         qUviZFAupS+mXeN/oewMnZKhUHwYYU5hL9lqxYLASJEnxdqt/d9HCcJs1qhYdEjYyZpg
         vanA==
X-Gm-Message-State: AOJu0Yyn98myijum/2iY2kKsKeF6mhuhnjOYV3FKL9ScbU4o1PG/OADq
	706nNHicl0F1T25JIn5zXGeEZj+GfZwvDcgPQiBVTZa0z5hDeoDEOkgflwkYLVXF4LX0XvzVYWC
	A68H5rh/3IYC2Rt8TOjZyrsGzwfPGkBo=
X-Gm-Gg: AfdE7cmeDVBXX/jkGXTDBU/8pLfOZmYNZcuMRltQOINKZWLnBIFpNxOwMk6bVN1dDXp
	PZhuyQYCoUq3Og0mWAl8e3QMCmCkedlwG2m9AL7WlgYcPVVnGXpcUpn2JLx7Rr/5gspvmuVGl4q
	4PpYmXyc2JzSNzzjPcTzOTU5BY4osFiv4f4qQrXuDMNwPdDmKENcKZh8RYLuPOKI1/N2T3Yq2hg
	Ruvv07YWNXmQ1zTweWw5oLofMg+LXCm+2UQJ4RP/MpbXwCfqojxg883+CdFQzlL
X-Received: by 2002:a05:622a:181f:b0:51a:8c86:bd3c with SMTP id
 d75a77b69052e-5213c9d9a01mr11762361cf.57.1784271549319; Thu, 16 Jul 2026
 23:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-4-akkun11.open@gmail.com> <20260716172730.089081F000E9@smtp.kernel.org>
In-Reply-To: <20260716172730.089081F000E9@smtp.kernel.org>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 15:58:57 +0900
X-Gm-Features: AUfX_mw-f0NpYAct72rPmUcEbtzcmaBSPm7yFj-EtAmmmokjNJ0yQdRy__B__oo
Message-ID: <CAKr_iV6PsWZ8MPsO2NdfS1ppy6pUCGjvn4MFF8UMz7updckW_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add MT6589 PWARP and MT6320
 PMIC support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 2:27=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Does using PWRAP_DEW_DIO_EN here instead of PWRAP_SLV_CAP_DUALIO accident=
ally
> disable Dual I/O mode?
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.30=
0885-1-akkun11.open@gmail.com?part=3D3

100% correct review, I'll fix in v2.
