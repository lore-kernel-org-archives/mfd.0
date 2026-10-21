Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626122;
	b=3YHXz7mVSHZW/4VFNkHKsIe8zipqBZL4G7KSbXPDdzLPoC8wV5Roz1OI5yGTVY+G1fFD
	 rES/XBQWL6TzQdhEXFDK+f/jVLjScsq8i4w0tcHPFFvUV5ONahl7NicQZ+DAKOD23BJ0j
	 NurRERxbmQhx8h+Qgdz2hNCVCIHgTBr6HP3YQzKUdTeleJIoJaqlZ9ULX5PekWWiDHgzc
	 mDfBWpZ6AHC66z2avXX8cIID1b0WFiFwMtR8Ht37jBldFJlwp6wZvua/Rrw/xQmOSno6w
	 3Sa83XEgUUHeXTjJX6rHVBV3yFiJfgY6ZCuDHSxHU8tuUVuUNPv7emJvrW+ieFJmuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626122;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=;
	b=FiAgi8ka25w/Er8dk0Hi5kX7QorOUjcAq1AchQUlNzcTDuhhkBbzkSPrPdZbNne/HpIy
	 OhhqJKa7NIifrDiQc/1Lfm/R4+wr3jBkh49XRRebyHXIECLq2RH+WmN7T8+trydfwbKfP
	 UWhDz5HQ5EbrxdSkq9gWs3H+qjbNGtWdA41MzE0Kqsc741WcRS3dmWgDEoWX7joenU6Qu
	 kQKyN4HYZI4zoHZjjBoeJVky+R6dzOoWUoPSkOkieVgJG163Nxv+xNEgAD0JrFbPIhoQS
	 J6nKy6o1Ik01K3V1Q0NXfTZLszILG2IQWx5TABrXzxCqRr3mvo4JQZtS0FJz+5Vbx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDP2AO6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46A606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDP2AO6L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C541F000C4
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626121;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eDP2AO6L+kkKUnaU0JyIxD94D4aBvCW5MhhC3PF146cPgJU3lcPMltZ20OmUid+bo
	 7P+HVDKuoFfSA2bAbtjF3SdQI2wMgw3YI91iRlfr832ZAzaxHdq1v6/uMKlMd+XOiq
	 j/7J62vWj8zmnqaI5Oj+NwqcLaTimIGXrv67GiNtmPHXOQqNRoxcQC+OBuCUChj3al
	 tA5ELvvXKHVJfAR8NOWAR2lu8NnSFw+9E9JLf4JUQPPuLNIShSpBdbWpLwa7EKYvGS
	 C3tQQse7HtwZexAufMMWpy7uh1Xy0ql1d3Cigy3s2VXS2oDkqMlLVsDh/Nc4ZthCNx
	 rRIItGpFXL5Ow==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1003883e87.2
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 16:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLgAas4VhYQgl7eljbmaQ1FMoMB/vNs27sh6Scg1sBkRsrBUY1IIS95TG7mfewVamoBRc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/4JVKBVbV+HJknVsRBGvxKWpq4/J6BEEs5t7Hd/NKK3dZ/l/v
	QKbqHD4Jyhz/njpDg8/+rw2trpIj3MM5YHZXng50kcpcjJVzjyWFb2ut6gMK03gDJ4Xo3RRj+DE
	Rp1UTdGHU3AaAkqkrDtTWvOyJKjQPijQ=
X-Received: by 2002:a05:6512:158b:b0:5be:50d6:af8a with SMTP id
 2adb3069b0e04-5bfa1ceb37cmr1176705e87.33.1792626120440; Wed, 21 Oct 2026
 16:42:00 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-7-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
X-Gm-Features: AclHuK9mN2gA0wqDEHlNp4kMbBvt1v7fcpPP3f_rBZxENespfrI6p61sISoyu5U
Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
Subject: Re: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ
 resource static
To: Lee Jones <lee@kernel.org>
Cc: Kumar Sanghvi <kumar.sanghvi@stericsson.com>, Sundar Iyer <sundar.iyer@stericsson.com>, 
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:14=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
> and the mfd_cell descriptors on the stack and assigns &ab850x_resource
> to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
> resource table via platform_device_add_resources() before
> db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
> attached to the child platform device retains a stale pointer to the
> expired stack frame.
>
> Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
> descriptors as static const so the resource pointer remains valid for
> the lifetime of the device.
>
> Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4=
c9d
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
