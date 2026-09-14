Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECA332610
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368853; cv=none; b=cw/S4UYNQ0hsQurENTkSSGbZoo9FWlVlTt1sV3JmHpxjJrsv7UgYNt+ynWnDQALoImG4MQYstIMg95qF7Ys8Y7KXaxWDwLjEtt5CAD6jvfeEXBrkRQhGeW33NuNyJe1foxzOwg06KIg8p7hIrLijd43geYWHYV497WUzqHv5HCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368853; c=relaxed/simple;
	bh=0PeBLaSvg3k9J7zOcUbnFVNgrGHY2SmueuKLDyV3d9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPiD9m6ydcG7SsXCK9iS4bSWDKNvW/ABy6T/9QIIHbr7+C1RSRVxNGd8L3FBrAG9ZDkz/PN6EhtORaS6fk42oFBrASJjE9EBvXo8d/p8s3l95+kg2K5ig6il1WhLcasiqSsSBe8ponirycgNZ1IOql2LDMHTnYlpL5bAHszViTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmEqsqbI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmEqsqbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A0A1F0089C
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 06:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789368851;
	bh=0PeBLaSvg3k9J7zOcUbnFVNgrGHY2SmueuKLDyV3d9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZmEqsqbIG3hwrieoHJDRjC5TPqL8kwNO4Qmn75Zugp81MZEK6MBNxYV+7P8B4l/Pt
	 3K0N394UB2uoUPEWT8liwTT8vQJ3dJaUUk2yFvMfRu6NA7DKQiCFuEJN0EpUQU2z2j
	 64Iw9SnoY4JIWeNRjTL9sHFU3ADESHwPXagVhZcZtUU05iNfBxGn4W8Yvlin5GO0P/
	 fqMQMFLMUQKPUh7duy4h449fkF89RDUt8xaUenL2EDT8VfsZDXIsqDBXMxIPxJW1Si
	 qBYwBdFpuuHd8F0Jkao2AV/ABOaOWMCIE48P/lzouQJR05XJEU1UJsm1aUaFS5J0RS
	 9oVVEw7yv9M4A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so3386292e87.0
        for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 23:54:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWX9kkXFVtrl4JUvrs/LGZIT4iTNV/ixJ1wqHAdzEuoSt5iRzMdPzDoCnr1qjDgbVvzrc=@lists.linux.dev
X-Gm-Message-State: AFuF++lCu2YfU2roPuXkcygaVgzSwFfkBXe7KXX+FEodcSvsxRo4XyD9
	hZIAVQL3iongZvZwVPzumaZkNtl4PgqvSJOoXM/2bhnAucQT0lUJUhy2ndXDRFT93CLz1pTKV3O
	IoHJa0GsHSFaFOjVbcL6hwGSOEDXuIT8=
X-Received: by 2002:a05:6512:2344:b0:5b6:1a7c:59d1 with SMTP id
 2adb3069b0e04-5b8ae69c79fmr269997e87.43.1789368850454; Sun, 13 Sep 2026
 23:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-12-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-12-fe88b01829bf@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 08:53:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLmuL3LEUU24zhPqfGm9My9ZvoniQeCfPWjqu_zWCFPttw@mail.gmail.com>
X-Gm-Features: AcwNN1W8KtuQMRYIeQ-BpYnjYrDQ687WnY7msCXB1OazrjGr30-ot-56dB2MoIQ
Message-ID: <CAD++jLmuL3LEUU24zhPqfGm9My9ZvoniQeCfPWjqu_zWCFPttw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] ARM: dts: ux500: Add new AB8500/AB8505 regulators
To: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> Add the newly supported buck converters to the AB8500 and AB8505 device
> tree includes. Use separate, native node names for the AB8500 and AB8505
> rails, including the AB8505 VSAFE, VSMPSC and VSMPSM converters.
>
> Give the 1.8 V I/O buck on each variant a common functional label for
> board include files which can be combined with either PMIC.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Bindings merged so patch applied for v7.4.

Yours,
Linus Walleij
