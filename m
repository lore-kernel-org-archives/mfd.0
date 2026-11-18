Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973706;
	b=fWRRMIyL6wKjKWNjpH7xmP8fVQ7Yg2IGiCJZ5aMpg/oXC3sMeJatxH4wyZ9fOXNKge39
	 Legn5Hb/Gs/nJawfmjwaYRVMcNSpW2XOPoHmLdJj4cDGNLmSxQ8+5IF2a9ezggmTJH07x
	 C3+A0R55jgcET098LdhuhPO8FEMSjuHTmIcUrHnToGT/9qHrOUgJwnnNo24IiNkY3h9cc
	 bQmv1Xhdj2V7z0SqD+4+/1wa7ETJL6n+foJpjkuIoNAWbXoWZ5h/3rvEsgsXgrv0soYr2
	 81NtW0jwMkd/dut0QcUV/tat+NSIa755PHC60IKn1uxhPIE5Cp/xtTJ99hCi9ZL0fBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
	b=BhmoANs0NOgScqdXZ20dAVuvqb/oz8ZJdNpOyz0Ku+BCM3C5gixq3H9UDDOMW3998Fla
	 XiRaI4bYuVEHtyJreTqFuwIKwm90/azqZgyC54xVoOvG4ghdx2G7bStQWLMtMBpvIyewj
	 KRkZoohRXU+8jKxBwNIxwkW4zw9Le2wANR3saOwMbm49ke86B4hrWYSb2K+C1OTOyjs/+
	 3bOL8iQgiu14XCmqAxHsDlitqm+O0+PcI2YR5guV+c72VQYJdYTJNQPhsXP/cILuWFH9n
	 ZcO73hJU2q5FLgfvp1M1M1O0yzBL+O037g1tUqOzpRreF8N2dVJrn0on0peub9So2rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibWnE9c0;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40874606A325
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 03:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40874606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibWnE9c0
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so260508b3a.2
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 19:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794973706; x=1795578506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=ibWnE9c084JhC0krgDA2S/CRARRRfS3JwkP/sQad4i1pOqo3riBNn1gxIz3HUw1r0Y
         ryLqabcei78Jvzq4u1AZPXbd5xhfSJv5b072usJ5D3huk1KFdwi5t8oZkN4HYl3QtQHo
         t5ps2zarWThzEOY3g4y16d6D6hFF8xV9ouPKLJ+RkzSybCnnmb2WtkYr+0AMn3PPgQ99
         uxtThjig7wDE8JIlZjhIFbSxcz/EA+V3uZ0dF+k7wdZsAR2KSW5X++LzpEsdBbK03XRT
         +5c4K6BA/CbgjEBaFUSfBrj3gMYnBP6537vyioLk/VU4E7nujZ+sEKRifJUDCB+8WXZS
         lePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973706; x=1795578506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=vHcASzOX1p/JmXhciGArQItv7br11EVSPauXvwf0bq2xm45n0hTm1GVB8TOGeDneAY
         Jn5eyun0s/CU/WouQsatRxSFEZJ+WNlg/0eRZ4yM3TKEIfLBD947J8beIzkjoIFMaVbL
         FNiiIY1Y3oRMhwL0SfIETSjMnWBQ16+vjeFd4s96o9URtzhcjrP0btfjhXrKNFBHeuct
         wam6jLuBLEYE1pL4WYJdo4kO2s58DQEFk3Y2+cZtDv/8dvUFye1k7p9WgkBMnKM+Z18l
         +9LTlUARNFsntdj+52Ux5Nsrv6lDfM0VTnBu+9Jwc13TqyuXF9/o8Hw4nOYGZ0/4rs68
         N2kQ==
X-Forwarded-Encrypted: i=1; AL+hErGfwX5eQJ8djNELghjabGiDPyk8i9351p71rKq2u+JLA06QlhXT5WiAphpeVQJ2jcDKTMA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/eTS4XeMSeTVmON6LeH12J7Egl4tT/jxKYmR+E0suyEci+d+oh
	Bs3xpT80YGPwGpfTh3+MgKJk5Wr/mFzZ5bbohDkJixned0E0kXgR7E6Vfd0ZGYrFIQ==
X-Gm-Gg: AYBFou24nquIeaz64UwRULHtvdYqDuI5w4e/nO/RDyvf+Id2BeBKqiCzgR9fQEX3TTE
	8K1JVbuxM6csKDdBGtpOis08vnj/VEOxfuYrjWp6pe+n25ijM/esxzeWF86L0gxiCjpRw6ctL3n
	iFQHhtJ18zglNZWXYAi5J+4BCo+wOBeg6trIKEDHZlt6t0IMIjMDgpmoda0R7q7hM8/Zp4w0Wx1
	xqfwcMFHF1/sa/AeuB6X8gqgcD70esFLxATczXO4xtMlLFv0j3z5JDm5yxEyjK6EkIfnv2gdXkN
	e0uYjvHGfNv9dFwqu/dWMxEZUnUAnrpKgVK/6YDcZmekWbA/79nR0UVCe+nSrZloOJLCxn0BUCF
	BeigFhaNH5vm6rsxs+qjO09f4kYUSTDsXCN6ZC3cR0YVedVUrei9omKd7vWpO/jjKNWjedXFUc3
	XycX7i/SfWwVv6hI53Srf+Pf8oZA/XPdhb8dFdTSGgt8eNU/MJLiCHpDPCwZC+sy/fEac9ccw+K
	XZFy2UluDCJH4AWlKVl7RHc1yZ6dukVVtxFVXuC2q91wrPQ/JNabjLo3T5aWv9KNtP3Fu4A0YXD
	0UvunZT+qXBBOhnVUnSGdhRJLIG7U0+jY3ZWQoEIPHndB405bVtZgYZ7TgEPaVBAOcbAvWlkiRE
	jXbEVvxGMqPFCKVjc3RisDZYkXpDf6P//OHkb/Ws7P4lK4WISfF1h+XfBCAZvVlrVq8QChtdF/S
	I1ZyVT/eh0AOO3
X-Received: by 2002:a05:6a21:8210:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-3fe872c98b9mr1476685637.8.1794973704719;
        Tue, 17 Nov 2026 19:48:24 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bb9f3e4sm380752a12.13.2026.11.17.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:48:22 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 17 Nov 2026 19:48:20 -0800
From: Benson Leung <bleung@chromium.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, tzungbi@kernel.org,
	groeck@chromium.org, jthies@google.com,
	chrome-platform@lists.linux.dev, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Message-ID: <av0gBCp63QZ2F8gy@google.com>
References: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4fjyoe2kkllcO+TQ"
Content-Disposition: inline
In-Reply-To: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>


--4fjyoe2kkllcO+TQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiangwu,

Thanks for catching this OF node reference leak problem. A few comments bel=
ow.

On Wed, Nov 18, 2026 at 09:39:34AM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Keep the node pointer in a local variable and release the reference
> with of_node_put() right after the lookup.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..593297df5 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -184,6 +184,7 @@ static int ec_device_probe(struct platform_device *pd=
ev)
>  	struct device *dev =3D &pdev->dev;
>  	struct cros_ec_platform *ec_platform =3D dev_get_platdata(dev);
>  	struct cros_ec_dev *ec =3D kzalloc_obj(*ec);
> +	struct device_node *np;
>  	struct ec_response_pchg_count pchg_count;
>  	int i;
> =20

ec_device_probe() already has a "struct device_node *node;" declared
immediately before this context. Please don't add another device_node point=
er
here just for this. Instead, scope it to the block below using
"__free(device_node)".

> @@ -269,10 +270,12 @@ static int ec_device_probe(struct platform_device *=
pdev)
>  	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
>  	 * the driver should be added as an mfd subdevice.
>  	 */
> +	np =3D of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
> +	of_node_put(np);
> +
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +	    !acpi_dev_found("GOOG0021") && !np) {
>  		retval =3D mfd_add_hotplug_devices(ec->dev,
>  						 cros_ec_ucsi_cells,
>  						 ARRAY_SIZE(cros_ec_ucsi_cells));

Moving the of_find_compatible_node() to before the "if" condition breaks
the short-circuit evaluation, causing every ec_device_probe() call (includi=
ng
secondary MCUs such as FP/ISH/SCP/TP and non-UCSI Chromebooks) to walk
the entire Device Tree unnecessarily looking for "google,cros-ec-ucsi".

We want to only run this search if we passed the other 3 checks in the if.

Also, testing "!np" after calling of_node_put(np) evaluates a pointer after
its reference has already been dropped.

Instead, please look into using the automatic cleanup attribute
__free(device_node) added in:
9448e55d032d ("of: Add cleanup.h based auto release via __free(device_node)=
 markings")

Scope the device_node pointer inside of the block (so we keep the short cir=
cuit)
and the cleanup will automatically drop the reference when leaving scope.

Something like this:
	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
	    !acpi_dev_found("GOOG0021")) {
		struct device_node *np __free(device_node) =3D
			of_find_compatible_node(NULL, NULL,
						"google,cros-ec-ucsi");
		if (!np) {
			retval =3D mfd_add_hotplug_devices(ec->dev,
							 cros_ec_ucsi_cells,
							 ARRAY_SIZE(cros_ec_ucsi_cells));
			if (retval)
				dev_warn(ec->dev,
					 "failed to add cros_ec_ucsi: %d\n",
					 retval);
		}
	}

Thanks!
Benson
=20

--4fjyoe2kkllcO+TQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav0gBAAKCRBzbaomhzOw
woP9AQCyMO9vyhePX5Mo6ySbyd6lVvlJLWQmBZ/JkBQ5++mtEgD9Fn8urRODY8Dl
tKHn5MQbfnC2KA+qSjaW58BRnL5tUgg=
=LNBZ
-----END PGP SIGNATURE-----

--4fjyoe2kkllcO+TQ--
