Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626162;
	b=0htOXR465Qdrw8NR5FCMMg7/myBztvsNofn4FIh693m0T5rGpJE4c+mtHefrMb+2wc/0
	 V7C/MWLnurrAxG4Kj0lWVbnw5YHqL4RrRkqbeRRceUOMz1AzEUvyd9Zi2n2FdgyC9hK4Z
	 oewqhIi7goo2UnYggDbnMAxKoZGJw0N/YKGd19QVBYkSt7xZOOeBGwO2ZA51Z5ZmBj1/b
	 QKy9WppIy9VdQmIBNzi5iX75opsYAMfaLbVGOORyEnkARGROUmfynZAy22jQUYgygTn4o
	 9AnMSg/UjFMt/vzs/xSpqUgfdJPGY+sksHc2slH6YPF6Vf28ME3QcpFaNrU8aWRKUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626162;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FCttpM/mIWeoisgI4Oe2UgAbsAorju2aXD0ZdeQI/eU=;
	b=YKH37+Ku3thfqOiBgvuXfoM5KeMtx8SIKe+Kd3oXbXSZ9SiCwtMSup8HN44n5UUMQjwi
	 0pzp5GsSZdOAGsElVF27xeGZkvrfxNSSRHtpRTklhlMhIR/hB4bdExLQSk6Y5/RzQFaOt
	 yr0Pu/BmYbOAZu9bNn788hxdrn0Vr3HXYW6uid2bKWd5qQOvoIn/5xvuCmb4CicKCMuR+
	 1nw55kx6lBUR+THvJ8PSQIF6pz8bn0JMW3DQ1A4AB9ylulYmQjySaMi3Y0qLpTC1/XrtI
	 cJPsPfxaE97x3JhrtQXcenfJTodO5w/3dbl0SrBMzq4afPRfQ6zWUvX1Jf1GLAKaU3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGY3K1M7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECF606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGY3K1M7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E481F000C2
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626162;
	bh=FCttpM/mIWeoisgI4Oe2UgAbsAorju2aXD0ZdeQI/eU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cGY3K1M7fCHt+Twn9BLTTxRcWwHGXe/n/oshtl388cWfeDxu9OoK6OywwiaavpZ84
	 dM5o9tAl9k8qM2pWUnYQl/zBYKFpouhsneqjvoz7jfgcG1RSPR3pGlzP5zLmP0f2ZP
	 zFmtKN6geV1ZKWVyRGz0ebSnuG5QimrsLqw2qk6DX5RhUdGiEmY2ZzLqDiFaQbH4gx
	 Rl2CXMZpi7GtzfCHCUDobVvkY8vuBmBn7A2+gHFHB3W4zCW/pzOxI/3wNaOqcAMwyZ
	 9hEpBKfGb2clVN0MkRmVipfUya7IG4rTBPUvKvXHtt3W62+MSd9m4fwkW0Un5pxb5t
	 ipnX66rl7+m3g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1363704e87.3
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 16:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwN8dKte1LvyozxBJ+mYf75IYVOJVFH93tajOX+AfR8CdmlbmLRIJn5iePTRkUJ6L8n/k=@lists.linux.dev
X-Gm-Message-State: AFq9FYISL4V3z/B2W7xdFTFDS5pOzYo07GbtB6qbD/4vwUHqr4M/1mjU
	MFhMGKT6MvU+U3+EwMl5iL0zIk8uPDizuLhi8U7+9d3Ronlt5/0KDToLEFfZVRG7N1Bgrq69unk
	VQu8GCt0Q+e8RXYwijk6Z3yPzIp7gFp0=
X-Received: by 2002:a05:6512:23a2:b0:5be:478e:c5d2 with SMTP id
 2adb3069b0e04-5bfa1cdba7emr1474028e87.29.1792626160903; Wed, 21 Oct 2026
 16:42:40 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-22-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-22-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:42:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmfKFG7uWWUQg42+vvaRg2NO8GGOji_qT9O+nabf8Q5+Q@mail.gmail.com>
X-Gm-Features: AclHuK-bW_sOqMKCXDtKCtW_jSZo6X1GW1kVojPPLhylF6_iQYgXHCX5xCW8YWM
Message-ID: <CAD++jLmfKFG7uWWUQg42+vvaRg2NO8GGOji_qT9O+nabf8Q5+Q@mail.gmail.com>
Subject: Re: [PATCH 22/28] mfd: abx500-core: Unregister device ops on devm release
To: Lee Jones <lee@kernel.org>
Cc: Mattias Wallin <mattias.wallin@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:16=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> abx500_register_ops() allocates struct abx500_device_entry via
> devm_kzalloc() and links it into the global abx500_list without
> registering a devres cleanup action.  If a caller's probe function
> subsequently fails, devres frees the entry while it remains linked in
> abx500_list, causing use-after-free and list corruption on later
> traversals.
>
> Register a devm_add_action_or_reset() callback in abx500_register_ops()
> to remove the entry from abx500_list before devres frees it.
>
> Fixes: c211b6b9c014 ("mfd: abx500-core: Convert to managed resources for =
allocating memory")
> Closes: https://sashiko.dev/#/bug/linux-6a9c6b8b-8f89-4af5-8cb1-102822e44=
e6e
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
