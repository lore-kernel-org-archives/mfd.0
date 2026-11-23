Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403059;
	b=MiUtwQK2AUyOfoFkVVUIM9yCkDtVN9xfOdgga9jWWTiV6KFXQvXwTKNKoMWP7bBhtNm+
	 aWXIjp42aNLGB0Aq68xVjjYKvFeLQt6GkefESCgiUJwgyOJbajWXT109RCsh85Cn/g9ry
	 DExQy2mt/eG7QSs6vEm8/RN3LJ/tTGCFoPx1Y1FryevkZGAay1wyGyjky/PwdePxCtOUc
	 JP688+jDlGzJvpmPGWkuupylCQEZPZyRhNihDKEJO5e3YbXNAJ1qYZ3ZS/Gm52KbIB6GG
	 x2nnNMyO9SDeEmEozbtAROiCsoG9z2my03RdSuTH5Rz0YAj38Vt6EpQQl4CMlsTHgDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403059;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bJz/w3sGQJ+AXw6+qpUDCQ1bi4lhKy1Vnb/sJSzGwOg=;
	b=Y0pjl7XMs8g8K0LGcmgRuUMczWDAki16aArCTN7WtLA1ZS2FKNoh6oF9ZLEkalOfQiwj
	 ZITMrB9D5wpZ5sKsbYdDfMy42WPvFQGWeCYH8h7e69db4og72QltggzaTCB4pzTwFK6mX
	 XolFpfq7ghn/2mtp1p8a8MHcAE8E3fod8o9DQ/P2A044o5VcoVSFJ1HfUzJdFt2NAzMRb
	 JnlO+eQr9Ic/snGndtLDiizCm82Qm96hYpJabl4xkj+YipfpUujH8f/2ZJ6Zgr4mdS2f5
	 sLjTtQTjqgwz2Se0kf5e6rRJwYqSXmFtYXUB3eZ+rC+mUrvOvzkEG+aCoAS3rTQDhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvuLhohQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB30606A31A;
	Mon, 23 Nov 2026 03:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvuLhohQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7252F1F000C4;
	Mon, 23 Nov 2026 03:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795403058;
	bh=bJz/w3sGQJ+AXw6+qpUDCQ1bi4lhKy1Vnb/sJSzGwOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvuLhohQtPp/6rlwM1bXi+0/8Y3z9lbsxjdYSIcGbAJlr+jUCI+L58yBEoYb3o5eD
	 shtDhGMDMl0XzGYkxX3UZRxIVgxpTHR3glCiH/4LeRC6MYJ7VEWm+Q9+MZg/KouSSV
	 YMlYSPA8SStfHGldiM8I98/13GZdliTczdr8NGI1zJ92tW7a8//3sycTeVEA50IMQO
	 aBDxgQrMhRisutY7UWnD/Ny5D4zPPaeosG3Rxp8xICKJOoEfddt9ovrttB8TY8xf8+
	 sNsPtaEZ6iXvh3z5qlReZ47Wk3mDCRm2uud1VgqZCsNrAQHHlK7hZjlc65+lzEtkCI
	 1zyNjLY1ajjAQ==
Date: Mon, 23 Nov 2026 03:04:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, groeck@chromium.org,
	jthies@google.com, chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Message-ID: <awOtL-TX-JQRmtKH@google.com>
References: <20261123025022.1761-1-laixiangwu@cmss.chinamobile.com>
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
In-Reply-To: <20261123025022.1761-1-laixiangwu@cmss.chinamobile.com>

On Mon, Nov 23, 2026 at 10:50:22AM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
> 
> Scope the lookup to the UCSI block and mark the node pointer with
> __free(device_node), so that the reference is released automatically
> when the block is left.  Keeping the lookup inside the block also
> preserves the short-circuit evaluation of the original condition:
> the device tree is only walked when the EC_FEATURE_USB_PD,
> EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
> every probe of every cros_ec device.
> 
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI")
> Suggested-by: Benson Leung <bleung@chromium.org>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
