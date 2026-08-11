Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3C8426D0A
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439889; cv=pass; b=pLue2of6BML9Gz1iKuRa6FaOtZUVbXw33ojP96P3VzxA1KD28y65TsI2lnQmFpaUbf4nyvXUK+taOpL6JCuiBhqFtfTPsQ+QJQy3ikMXyS8sfs6riI3jISmpjJixQ9/FuDReqrhRnlU8LStQhRf6vknzfOUFdmwGKBE+zx5LYJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439889; c=relaxed/simple;
	bh=E/WyVaXEm1ailWzhDmRZTqHbF+V/Ukp1mPzzzzdLyhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4vkXVGJE5no+CRjqCc/ER04PRSzMzNH6hIvQ/Htv+k5s2FfAsJsOr3Mtu8TeKcg2Xg/gh7rnNzmeNLnQPEhgBliVDi0BwAlWpC+lyjuo3QFHyD/RPFFe0Y4GUeg0lVq6Zk6gA7eNuBHZpUt/iZUipSBBjgh6Pr0SLmKNd7KGOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm6+SnTY; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm6+SnTY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so4309132a12.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 02:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786439886; cv=none;
        d=google.com; s=arc-20260327;
        b=md4Ic0c8GYbVzucRzDWQk5ZZ+NXmLF34j0l0wj4NFdkBdjVsvvhjV7ivXqSIf3K6nC
         LeCpXREmekAdgo3DoLqLIl+LOggQPJSY2j8hspW3+uRt6TXO/IUTvnO+i8TEJ9nHTiDv
         n5a/hZn3u1wNeVyOPH+/7LT/39dLaYJ7qu7oSOoed3p8GHliBNlKxSxxapYI5VytJNLg
         0Qc98KBry9rKMTKHEtaRtec9Q63XxnUN8MCHuyjdyPC7c39uLQhUiVITQPjWywIn8szY
         x6KBQVd10OQA94/J+35fHyVB1W2iyl42r72g61/rizuedjXr+PGdW+fZaIRpCUWU5CdR
         8qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        fh=epiRZUu2QF9Zhgkxeu3SbYhbtVQg8dbezUiYMDbQenw=;
        b=boI2oZSLhMzbEARDqFNLqtEXu9lNoYuY7Rbrre9gRRQ622NPfs/6TtJ0DV8rkgwKcs
         x10KdQ757CUxGPvgCYzXWDzZ3pHIf7QMPfWyaYZZvMQoYa3KbF6xGW0OhGbdI+6m5YCA
         hhLAbzVy/l/5m9Ps5mRlaz//u81V1/JbXsfxpdUi6snJxZ+G4UKoPxurnuctnHNLvcvu
         xtOrhU6GlygjOJLcZSKmhgSnjL5IWHh6vbPmUsBuDKwHpmbZeSwLex0nRnld1Dyo7bdZ
         TzYDFfw4TLVK5QrRntw823nf+piALuvbG0tYQ4vOaIAy0+O6KQX7Dp9FKu+OxWp54kT2
         PlDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439886; x=1787044686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        b=bm6+SnTYNLv/PpHR47z0nuKIkrAC/MCxzGT3OvUVPZrN2nL8p6PktbDaVq7Zzk/1VD
         xOyc0X3HYJTxQzN7dZdSB/iABmng5AszFS6vb7nlgVxREuBbhWApPMHMAdPgEoT+w5gL
         SOYsPyfjcepee7tSEpwtryUMLN6RW1iS9siA5/Z1M8Nr8tXVY8oHc3FWuoZHIZXur7SC
         R2if4SKUhCBXuZRmvQElyucKddF7inXjaLKZ0GXsAkSMMHjENXHRMrJHlXZlrbqQ0cQK
         fh71wpWN9WlnRn+LoAupmHvvsyCK9PbLoAYf6d1vCnLMsLTjsGqd2Jmwa5hYGWyAwT/k
         LNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439886; x=1787044686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        b=OnfVSSJtVPGeCiF9dyGRDiR9zmWgpRZUs7m1XaDLCruU0XgVGblOWR8ZQcFQV4+Qxo
         5ENeBi5s/VaU2n9gc8Mq4AniQTM1ZInUwNX+5SWC0Krlh35DsOo+vhYyn6twDmU/eJO2
         Ui2Bfav+1EBfpp3EVFLVeLz7L2RakD591Ey0dNzngvnRiasq+W9+PdHkQsCkfZD+JBUx
         dlBHXnqq5rbrBqCxEQgIfaj1tngRxINwCunpSrbkLEXR0JkalWDYRmWsBAA6tsk/4sMr
         z/eDA5wMq8EwVFI8A4ruWNwPELCwdatrR6WWsCHCh4gJlsMntdD5xxUHQ6TwseWt9tA3
         IMDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZMV9OlEFbOaMhxSny+p2tSJR7igeCa/0Gcla8QmipPhoYRoFpAv5tFfqgUAUJg8w5H+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJVvFjHTlqAlQLU3FMoiTe6un+RcnF+LbIwkXnppi1pj6SrDoQ
	fNeM7kNU954yWHujRmv6nzzAsh/mSpHz7f0zVPeu9YVZHGBVtPyUoAqc3crphTCred3c3lKQ+w8
	ZEZLKL2CXbegmE4CjwE7LM3NIq35SbTo=
X-Gm-Gg: AR+sD1168csXznS5akMHERiO+i9u3CPy4/X6gznqlnF+BVgjvagka+PKDErZsk4GJUR
	fadx/KbM7AlQ41QqjvPIJDxfkm8BTFEmBPhCit5jZg/gbJWiXCCx/VM2hT/sKCwm5v73gYcsmbK
	RCU2zB+MfNHLUR0SaDzq34LY+cFNlHnbX7G2p+85kB4mpBzQfMp49rgJa+6sm6f2CeF2oaEnUAN
	mAxNlwpTF4vhZnsfECBILD46+CXM0HqTa9Na+fXkh8iv5K04VV7kqRiMoAuDbCn7zQTrgwTCiIz
	jy/blNsK5/WmA0OfsXRmyHK2A0A/qiK9RzBcku+uyBabdkfT2KY3Ts/MpMZW/a19ouC/A4p5y3K
	+SqRWSRua+UDyVQn2vwo6cZvRuBFYg2N5o+CZKjFhBArGFd4MH3icD4sKxJXwW193wk9oOE06DQ
	STjZD8mVTb5nDBIAXn45Wahv1u0UQSvm8ttQSf
X-Received: by 2002:a05:6402:e96:b0:698:351c:979c with SMTP id
 4fb4d7f45d1cf-6a364481563mr1065145a12.2.1786439885525; Tue, 11 Aug 2026
 02:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
 <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com> <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
In-Reply-To: <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 03:17:52 -0600
X-Gm-Features: AUfX_mzC4JSTAlnl1EzMlisJQ715ApqdEvoqRN3H1IkIyZEOTQ7rFyRKrkMcin8
Message-ID: <CADvTj4qUEA-ccFj0cSQgHb8+0jB4m6tcpsZZwveZhC_RE8w9vA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: syscon: Add managed registration for external regmaps
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:47=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Aug 11, 2026, at 10:27, James Hilliard wrote:
> > of_syscon_register_regmap() publishes an externally owned regmap in the
> > global syscon list, but provides no way for a removable driver to
> > withdraw it. Registering a devm-managed regmap from such a driver would
> > therefore leave a stale pointer after unbind.
> >
> > Factor external registration through an internal helper and add
> > devm_of_syscon_register_regmap(). The managed action removes the entry
> > under the syscon list lock before later devres actions release the
> > regmap. Hold a device-node reference for the lifetime of every
> > externally registered entry so its lookup key also remains valid.
> >
> > Consumers of a removable provider remain responsible for ordering
> > teardown, for example with a managed device link.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Hi James,
>
> I don't think this is the right way to do it. As far as I can tell,
> the device you have here is a generic mfd that uses a regmap, which
> is not the same thing we usually call a syscon.
>
> The of_syscon_register_regmap() code path was added specifically
> for chips that have a traditional syscon but depending on the
> firmware may have to access this by some other means. This is
> already stretching the definition of syscon. I don't think we
> should take this further and allow normal device drivers like
> yours to register through the syscon framework.

This was suggested to me by Andrew:
https://lore.kernel.org/all/c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch/

> Since you already have a top-level mfd device here, just use
> that to pass the regmap to the child devices like we do for
> other mfd drivers. You can e.g. do this when populating the child
> devices through platform_data, or get the pointer from the
> parent drvdata.

The EPHY is not an MFD-created platform child. Phylib enumerates it as a
struct phy_device on the SoC MDIO bus, so its device parent is the
struct mii_bus rather than the AC200 I2C device. It therefore cannot
directly obtain the AC200 regmap through parent drvdata or MFD child
platform data.

Here's how I was doing it previously:
https://lore.kernel.org/all/20260806-submit-acx00-of-dynamic-v1-v4-2-9bf2f7=
441632@gmail.com/

>
>      Arnd
