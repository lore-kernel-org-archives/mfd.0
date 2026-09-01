Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C74A3853;
	Tue,  1 Sep 2026 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294432; cv=none; b=D30IiAp7W8o/NptqQORK1/7BAUJHZkMie7PQYQAaYOsVu7cOYZOE+8QNde+/4xYkIVBJ8Omf8N2NwwYfkAy4lOlC7QrFOTRiyXLoBt3D+pEC0ZOXWExLf9h/06GBygyogmiPRyuGRIhCL31uiGFpYaLBw54o6jzn62e5tVU4NNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294432; c=relaxed/simple;
	bh=N5RvueuAgY81AmJPzXPoCXvEP9mUQH4KHfd4rrWzMRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pjp+gZdTejCgT6DVPjsmHwYy/BPMOUjkHJj7UMEo4UvcZjAF/PImN1Mn3ixPyxCGZq10OqpAftWmxIQwME9L7fuNJfgkPlSTVHWyCE57SGMgqyn0Lm+3xQS6eHC1JqFIQ/ew7dAFVsVug6fbyO6zxJwGAMWrZbUd+jqv07otimk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vwl1Rx1a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vwl1Rx1a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9BB1F00A3A;
	Tue,  1 Sep 2026 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294430;
	bh=N5RvueuAgY81AmJPzXPoCXvEP9mUQH4KHfd4rrWzMRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vwl1Rx1aCt/LsLWaes4lE5FakFkGNISwSAzj8GRi7rC6IoKgKKFl655Tp5DLMwhEJ
	 TMVXdACsCB50bIPENUw+5dBrE4md5oEQAFapgX2x5+FsOxxhbdOEv3NBc/Ntd+68hl
	 0TK5yFS5O7l/363lh8PDlSZYyURDsYI4sTt9WUzoYr0SHOyQZ5Esb2ZC+UbAY9Cj8f
	 O1ZQttJrH8htMm36PnawwSWFz065CJ8JKubWlObSFOiVgKRnXiTM7tnxD+H2hdDf8L
	 uasRvIoH9EiHA8Eb9xuCFcIujm35m/lympBWqkODXCZ0i94Lfj8MENo/ZiT+jZ3QGT
	 6nzPczve22LmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/13] regulator: ab8500: Use linear ranges for LDO
 voltages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-7-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-7-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:27:10 +0000
Message-Id: <20260901202710.8D9BB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> VINTCORE uses consecutive selectors with uniform 25 mV steps, with
> AB8505 duplicating the highest voltage at selector 7. AB8505 VAUDIO
> likewise has uniform 100 mV steps followed by a duplicate selector for
> its highest voltage.
>=20
> Describe these selector encodings with linear ranges and the matching
> regulator helpers instead of enumerated voltage tables. Keep tables for
> the irregular and non-monotonic VAUX and VANA selectors.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D7

