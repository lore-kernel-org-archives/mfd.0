Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003D331A43
	for <mfd@lists.linux.dev>; Sun,  6 Sep 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695403; cv=none; b=q1Ac3RvT6EskEYnJpmpHpODhpGbmb8DU2fYt2EqPIJdxkdlJposyFurogL9JciByyBRubuzu99IEWu6p43VwBxkVqaY2+CSP6vy2YnPEMi1lEWnyIhTveCwIZwzBfu1Ra9ixY+k6mNI0UpE8Ucyjr5WP1nDBGa5npeGE06YvIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695403; c=relaxed/simple;
	bh=oGTWdpMnaXibOFppiWaq0dXI0MnBNIFcwkjra8nz7yY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JT+pH1lWA60GGq7NN1WjKnFFB45btH9i6pUwLv0DkOkX1iG4VdUkxtJE9ND9xSge0yq5UMi2Fddgt0J7NgXT/+TrxHeHaLTpjGVfppbcaqWIxfcGrsmsak5raBPtr+vArshbZQomzLeqj1ZJdr2+xCxKool2jsOAXXfRH8ajZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ko+HRZC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ko+HRZC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D1E1F00A3A;
	Sun,  6 Sep 2026 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788695397;
	bh=IwJ0jYtRu6MrVuF72gNLZLzsi3Tbm8G7zysjn6SVkLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ko+HRZC1OryZQDeLK+qCBgR03+DQr9kZvwqNrOK1KuoBw2ULD3zSxO8gasx/JoEnP
	 t1cpJaSaYgGeXSNO5DnhGcWeIMG0WBp7PIufFbpUBuIgAtbxqxHR4SdecCCv5R1feh
	 6uoSGuEznBc4R30iFkZujA0jFTV3EEKPJVDLGcWSNdjKl7/b/Zr9W0890Bibez6HCO
	 sArfvR0v6qmnrfkMrczHGIn9EyDAR/093+bJLx8pdzJM7+nFKJE1uD3C2TlCTKMYEP
	 nVHwpr1GxhdDWq7iGFa2oq0Uxy6ar8QoZOIAsVDi1Zb9y/v2t7smpAVrO1HRD+TpoS
	 rBJshpjdupYkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pwm: lp3943: validate DT output indices in
 lp3943_pwm_parse_dt()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <6a9d5118.a865c849.172a3c.4f1f@mx.google.com>
References: <6a9d5118.a865c849.172a3c.4f1f@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 11:49:56 +0000
Message-Id: <20260906114956.E0D1E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Passing an enum array pointer to `of_property_read_u32_array` =
causes a heap buffer overflow and array stride mismatch if the compiler use=
s a smaller underlying type (e.g., with `-fshort-enums`).
- [High] Missing NULL check on `pdata->pwms[hwpwm]` in `lp3943_pwm_request_=
map()` causes a kernel crash if an unconfigured PWM channel is requested.
--

commit 2bff859954d5825f1b63378dcea622868d103bda
Author: Manush Prajwal <manushprajwal555@gmail.com>

pwm: lp3943: validate DT output indices in lp3943_pwm_parse_dt()

This commit adds bounds checking for the ti,pwm0 and ti,pwm1 devicetree
properties in lp3943_pwm_parse_dt(). It verifies the raw u32 array values
are within the valid range of 0-15 before storing them, preventing memory
corruption and out-of-bounds reads in downstream consumers.

>     Both consumers of pwm_map->output[] then use an out-of-range value
>     directly as an index/bit-offset with no bounds check of their own:
>    =20
>      - lp3943_pwm_request_map() does
>            test_and_set_bit(offset, &lp3943->pin_used)
>        with offset taken straight from output[i], corrupting memory beyond
>        the single 'unsigned long pin_used' field for offset >=3D BITS_PER=
_LONG.

[Severity: High]
This isn't a bug introduced by this patch, but does lp3943_pwm_request_map()
lack a NULL pointer check for an unconfigured hardware PWM channel?

If a board DT does not define all PWM channels (so pdata->pwms[1] is NULL),
and a consumer requests it, won't we dereference a NULL pointer here:

drivers/pwm/pwm-lp3943.c:lp3943_pwm_request_map() {
    ...
    pwm_map->output =3D pdata->pwms[hwpwm]->output;
    ...
}

[ ... ]
> diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
> index 10537e74be288..e8bb8dbb9b67b 100644
> --- a/drivers/pwm/pwm-lp3943.c
> +++ b/drivers/pwm/pwm-lp3943.c
[ ... ]
> @@ -247,6 +247,11 @@ static int lp3943_pwm_parse_dt(struct device *dev,
>  		if (err)
>  			return err;
> =20
> +		for (j =3D 0; j < num_outputs; j++) {

[Severity: Critical]
This is a pre-existing issue, but can passing an enum array pointer to
of_property_read_u32_array() cause a heap buffer overflow?

If the compiler uses a smaller underlying type for enum lp3943_pwm_output
(e.g., with -fshort-enums), devm_kcalloc() will allocate less than
4 bytes per element.

Since of_property_read_u32_array() expects a u32 * buffer and writes 4 bytes
per element, won't it overwrite adjacent heap memory? Also, wouldn't array
indexing with output[j] then read with a mismatched stride?

> +			if (output[j] < 0 || output[j] >=3D LP3943_NUM_OUTPUTS)
> +				return -EINVAL;
> +		}
> +
>  		pwm_map =3D devm_kzalloc(dev, sizeof(*pwm_map), GFP_KERNEL);
>  		if (!pwm_map)
>  			return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6a9d5118.a865c849.1=
72a3c.4f1f@mx.google.com?part=3D1
