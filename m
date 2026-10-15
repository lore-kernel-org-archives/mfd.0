Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E591A0BF3;
	Thu, 15 Oct 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056146; cv=none; b=cXCyJwwTNLjd+xRRePLGHKobtrMTCnDH9p4YSC+psvjtgU2oLwIVg9tge54lAOEbwX+9H2IS3ol7Wh05b0tE+KAu9ADxa+6HlA+2Zw30v2AgMId+Qeqzykok7TucpnMZkVmIDmbQvCqU4bzXg7bSe6JjVoK7x8kT7jelQzgZ0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056146; c=relaxed/simple;
	bh=DZ+ckHVBo5Aqp7/YFPow2uJhQI0JirnxDbjNHmGjx6w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n9Xd6VHrKNT00IK+gDID+vw+eGwWkWTxcbZIPyrLVkq20y6/T7TAZeY+X72BMYaC/xw/qCFuhc74nSVAyAVwCIducs0OzPKb/AtvMlMjawMyS42OcTcaNCJ2XiWovvV42ZaMVeA9FH/Kt0kaa6xPUkBHWgnuBNNyYf+bqFeMfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFhtVGf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFhtVGf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542161F000C4;
	Thu, 15 Oct 2026 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056144;
	bh=gx+PkpGOKZ4IwVdNPeUudktmree1fafNvihHrBs2fow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFhtVGf4PAXhkM/VO3hsMYoMdaBtRe7f+O9GecylIY2WbpflNzm3In8ee5qvwIS5l
	 ft+jlDhlCnCRoogTBM8N+eMC9DlyijBYi1JbCHZyMwmSsvhWMrxDvs31yQLTIGtTha
	 i+OT8LaufWKjt6htlRbKtpmU+9vVATQiJS+XIo6o679MnfBuROhyR5yJ3M4U7NFaF3
	 9Tp6hU3QuD5Jitbpj9TNzbTlq8ZMW9aQXEJaqxUKjQWOuBLHjndgSw70FXdUMcltOp
	 GUspuDmQO5+6FQ760u1DfKYvdJZniU33E9hGUyqNvx0Z73j4f9f2GmsF/yVyFQDduU
	 0MZ5NU59Us97w==
Message-ID: <sashiko-outbox-172565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:22:23 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] backlight: ABBA deadlock between wled->lock and ovp_irq handler
- [High] backlight: missing cancel_delayed_work_sync in wled_probe() error =
path
--

commit f07dcfad88603020539ad65ef60f36337093bf41
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

    backlight: qcom-wled: fix unbalanced OVP interrupt enable
   =20
    If the bootloader leaves the WLED module enabled, the OVP interrupt is
    left enabled at probe time. The first brightness update then schedules
    wled_ovp_work(), which enables the interrupt for a second time and
    triggers the "Unbalanced enable for IRQ" warning.
   =20
    Track whether the driver has disabled the interrupt and only enable it
    back in that case.
   =20
    Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection l=
ogic")
    Assisted-by: LLM
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backligh=
t/qcom-wled.c
> index 650dd95f06ef5..f2e0430cccbca 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
[ ... ]
> @@ -321,8 +326,11 @@ static int wled_module_enable(struct wled *wled, int=
 val)
>  			 */
>  			schedule_delayed_work(&wled->ovp_work, HZ / 100);

[Severity: High]
Could this delayed work execution lead to a use-after-free if probe fails?

In wled_probe(), INIT_DELAYED_WORK(&wled->ovp_work, wled_ovp_work) initiali=
zes
the delayed work without registering a devm action for cancellation.
wled_probe() then requests the short IRQ, making it active.

If a short IRQ triggers during probe, its handler calls wled_module_enable()
which reaches here and globally schedules ovp_work.

If wled_probe() subsequently returns an error (e.g., if
devm_backlight_device_register() fails), devres automatically frees the wled
structure without cancelling the scheduled work. When ovp_work executes, wo=
n't
it dereference the freed wled structure?

>  		} else {
> -			if (!cancel_delayed_work_sync(&wled->ovp_work))
> +			cancel_delayed_work_sync(&wled->ovp_work);
> +			if (!wled->ovp_irq_disabled) {
>  				disable_irq(wled->ovp_irq);

[Severity: High]
Does this code introduce an ABBA deadlock with the OVP IRQ handler?

If wled_update_status() or wled_short_irq_handler() disables the module, it
holds wled->lock and calls wled_module_enable(wled, false), which reaches h=
ere
and blocks in disable_irq() waiting for any currently executing OVP IRQ han=
dler
to complete.

Meanwhile, the threaded OVP IRQ handler tries to acquire wled->lock to perf=
orm
auto string detection:

drivers/video/backlight/qcom-wled.c:wled_ovp_irq_handler() {
    ...
	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
		if (wled->wled_auto_detection_required(wled)) {
			mutex_lock(&wled->lock);
			wled_auto_string_detection(wled);
			mutex_unlock(&wled->lock);
		}
	}
    ...
}

If the OVP IRQ fires concurrently, will disable_irq() wait forever while the
handler waits for wled->lock?

> +				wled->ovp_irq_disabled =3D true;
> +			}
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D1
