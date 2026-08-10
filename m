Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117083D6498
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370901; cv=none; b=DmnD+ulcK6BBctbiR1+3e5x95yC6x1yboYHZDaKibWRHf9UtD1qc7dHn1rHYfSU6Wki2R7+7jPp7gNXhoRWkk3uiDfwaPg1wrYKzF/IiOSzcuOrKtNEkCZZv88ABeHESQW+YhIgT9hYa3g1hCW3NTHJG6FdekG677nYmpmIK8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370901; c=relaxed/simple;
	bh=wgjZjzPY6iePsx67ehNXx60GXyIpYhG/SUcjhFtMrTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JOLXpnToK+FZf9gM69GrV4yJyvtxtak5jcOWEC++LasXRuL0mS5ys6VScxB4WEUT+hYM7qvP1XAHmZ1aTlORxfs/aOo1o+ZLW+kzH9ccwoGcBDDonNcCchdxscEWJYAEl6CpASpHxU4uYNf/aRongIdFxWXXER3z03pHIvEAGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhZv3vBM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhZv3vBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D871F000E9;
	Mon, 10 Aug 2026 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786370899;
	bh=wgjZjzPY6iePsx67ehNXx60GXyIpYhG/SUcjhFtMrTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DhZv3vBM0rb4b4rURwBcmEq3JjIfGkqb1DlovSWYUroRKJX3bw9T47c3VDhXLahYE
	 J80o0dPlWFFH2jxWiiNvU1XJKIWWCB85hJACqnCeRQeOSUAom/FwcGQD7sEKqYJnCz
	 L/h/UTtKQ2LT5l58QeLCgL6SbKiayqTJm7JranVbw6cI9upMKmtrlCdDOM4r7DRWQ0
	 uTOLb+GQSxTQxZff3O94aqE0n0GUJPTNp1JpWuN7dAEWoJLSkERdQkF6nfJI8rdzYq
	 JN+vhOEhXxN581tqqLmb+jZ6pwMHSbocn0fGjMg/H3i2jjf4EaC6Thag0aOZ1fCoI7
	 SuL8wgMudJuhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 5/8] ipmi: ls2k: adjust dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v8-5-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-5-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:08:18 +0000
Message-Id: <20260810140819.18D871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> There is functional dependency between the IPMI driver and its mfd
> driver. Previously, the dependency was set to "select" from
> IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
> compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
> option. Therefore, the dependency "select" will force the mfd driver
> to be compiled built-in when the ipmi driver is built as a module. This
> is not desirable. This patch fixes this by declaring a conditional
> dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
> This will allow the mfd driver to be compiled as a module if the ipmi
> driver is built as a module. The adjustment to Kconfig for the mfd
> driver will be introduced in the later patch in this series.
>=20
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D5

