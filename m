Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AF4A8420
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374605; cv=none; b=tObytIOwg+umi2AErUgtC2L3Ju7pNt2T7crSxf3gfRXHqk0q3WXisF/cNQ+2yhY8n7DXS3/jJhxJiKwZEbCtV80NPxfTDerMhaH08jTDBVKZNEP5M5TdkruwwL1WNZ23sT8GaJ8AQ30MidG9oplXNu2EYHSfRd9ETlRj5pQfkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374605; c=relaxed/simple;
	bh=5Keyffio6qVpCs5QPavKPlOqOswZ2klYgfP8rJs6TiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z+LSFTMbFhEy+M3WyTwA2OpAgF4MTYaKYyNYYGlt5iXKWlRy5zCAwBOtN4WMlj3MwqBiiJErufg/0xLiOg5Tl4wp4lK9tmpMLua/O0lg11XAM/HjIfu6CksIcg8IovzNCQj4oH9BXqWoZMeiN2waVl7YauL9+hkcQhljQg+3isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lEJXhZ2l; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lEJXhZ2l"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e257a23aso1061742f8f.0
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374601; x=1788979401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=lEJXhZ2lEyolytukA6smzDx0VElclzuqEdjdZjTF5FXbt2T8pvUO5FDM79odPw/8Kv
         fy3IarJy6BuRCRn0K+/QFLPrpMUhVWrYBCZtbqyOATkolOuP5wx0zphIw3NA8K3K4MM/
         MGeoJKyzJrwVk9PPbFGR7jEPQxGVoJ5tT2dod2WkZs4IZ1AO/JCHg/oWkZ1x/XQe6S/H
         7zlWQ3XHMAFySGNb2InbU/wf6WMk2D6/iPtx7a+X3emtc10t8idyooLkeF0nUwTTBq34
         REXoeSazWZi+xAnWA798I449Yy63P1buq/h6ViKWayQRyR7sdzCPht2oi5lIki7rwChI
         8IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374601; x=1788979401;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=eVld+UfOX/WpZgeGvanLj5cGhTD2tK6hp6QJhf+LutIUUd1FnVOmJGehCgsAHhY3jF
         I8FpLccss/GIuW8815gJyvjBl9dtOcvVG23H3TXBs7emU1jW0q5pgB6Em1mgi8BKA1at
         ZSb0if7mUy7Fy3GY9muVt2sNT+/htuJ3cP9NMQvEDcj7Edei8grmjXw5JXXBpH2YdhQy
         +uN3B2A4z7D19nsDeS75yPQHA63pbceDGncppQDl6Z4J2PrUT7k2zYEyjwxlmaAwkKeR
         Z3iaHpqRKRCfH4xHwx2ChwbOT6FZugSjZNDEvh+JwB04+y/crJHcwbstIQdyNxPyzQ5I
         vLxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZDRr2Ak+wM3s2qrQMTg+hiyFo/7Op+ba9AZZgMRs1Q9sEE4VC1hpNpmuNHvy4N3i2vWQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mQwSt6c0TE4Mu8eO6YF1JVcq9aDO8aUFWsThBV8MWdfD10ktp+
	VW81ErpxTsXT3o0Hb4TxNvITGz34j6BTjmEqb5tIeWi6Tdv5yygNtbYOxQKaiDiuyWk=
X-Gm-Gg: AYBFou1uCPPba0lF6jppSB52crcW1qTtPvporqoUAxMDVh6NPZdE2A8ajKe7u7n8Vpf
	WWKXQ6FgLBGuZAC3nGiDFAAe1eTF13qfREdionis/24DlXuECZSYx3bGxFOo64+dIY5leC5RfHj
	59hQzRGeFR98KM1r+K1/9aMr1qWaLoIE9DT0oMxKCfi25OKhoiim6ppvxl6aOdFJ6NmO/nuBi3p
	N7TXe5mfdag97bUCugoUIo1GDJw8BZ/qAQ01KDKTN34gjfAUCBw/CCQ5HTfmlqd0ARf6H5Wp6aV
	iRVXT+wBKUQbUhCSaM/+paQ3gMfaM8SVDpmV9qxcKzY4vVbUdP/5unQdBBFD+dzYGnyzAuBQzfe
	xFQT/3K1+fqr6BeNxmDYRSJBth8nVfSFCHUHKxOoWMWvvgv81Feqt86Tms/M/xPOkWmdfDH8dQX
	XCIAXCI4xcOLBWhfBg5o1POA6vfHqog68XhaV7aLCHJWgjwyyXMavn4kLYNWxT0gKE4uaz6dXPE
	9YAPCw=
X-Received: by 2002:a05:6000:1847:b0:482:fb9e:4e20 with SMTP id ffacd0b85a97d-48488dee407mr12111460f8f.6.1788374600680;
        Wed, 02 Sep 2026 11:43:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8146112f8f.28.2026.09.02.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:43:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260827134235.GN770273@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
Date: Wed, 02 Sep 2026 20:43:15 +0200
Message-ID: <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 27 ao=C3=BBt 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:

> On Fri, 14 Aug 2026, Jerome Brunet wrote:
>
>> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
>>=20
>> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
>> >
>> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> >>=20
>> >> > Thank you for your contribution! Sashiko AI review found 2 potentia=
l issue(s) to consider:
>> >> > - [High] The corresponding regulator driver lacks support for
>> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to f=
ail.
>> >>=20
>> >> Funny sashiko did not pick up on this when v6 was first sent. This is=
 an
>> >> ordering problem. The regulator part should be applied before the mfd
>> >> one.
>> >>=20
>> >> I could reorder here but there is not much point since the 2 changes =
will
>> >> land in different subsystems but it does bring a valid question:
>> >>=20
>> >> Lee, Mark, are you OK with picking the patches indended for your
>> >> subsystem or would you prefer that I split the series, regulator on o=
ne
>> >> side, mfd on the other (with a dep on the regulator one, of course) ?
>> >
>> > Does this break existing devices or simply delay support for this new =
one?
>>=20
>> Existing device are fine and untouched.
>>=20
>> I've just checked and if someone tried to run without PATCH 5 (regulator=
s),
>> the main axp driver loads fine but the regulator part gives this
>>=20
>> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
>
> Can you not enforce the deps with Kconfig?

This is not a build problem so I do not think Kconfig will change
anything here. There is no specific config per chip.

It is just a runtime ordering matter and not a problem. regulator and
mfd are split so at some point the support is incomplete.

* MFD first, it is fine it just cant instantiate the regulator until it
  lands. it is (mostly) useless without it, which is fine.
* Regulator first. regulator will never be instanciate until MFD support
  lands, just as useless.

IMO there is nothing to do here.

>
>> Seems sane enough if the regulator part is not present (and no board
>> using it has landed yet)
>>=20
>> To completly avoid this, the ID would need to be in its own patch,
>> then the regulators, finally the MFD. It seems like an unecessary churn
>> but I can do that if you prefer.
>
> --=20
> Lee Jones

--=20
Jerome
