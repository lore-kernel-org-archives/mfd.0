Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9234041B
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046559; cv=none; b=BBEPcU0gAe2u5NeGwEyQooB30hUElTwAf1AMDLXoz4d0Pu5dxudomqlBZcf8zbBzjvj07KSAYaH82O8VCeMyjlWsQnaEtFshikdVAdClOud9dXKrVH63D9ph/RB94qrx6cBK9iAsjg/ScpX810zP//tfYFVsKvpiQ2WA//8P4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046559; c=relaxed/simple;
	bh=EeFWvfk3NZdnQrk7giSMdkZMsj1kCf4goWQFQhVwIDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1aSu0VMiOG8tG9lvYQzdcM2UPx/Q+vSuyX6X4b24G724txFfPRzROgTkYlAH+VEIUj1LWS7082IDjbsEcXFuOxPR1Co8XsjvEqNKnofk60XPd7PO12PtZVkVQ9MPim80BuTYklyMfV9mIhCe+TyYu8qTMEBRuWU6ruIsczLMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hhRuVzOL; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hhRuVzOL"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so2238079a12.3
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 23:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046557; x=1792651357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5OC84CDQYOd+M3r9XSPMI2kjxix5Fp0PhVrunFyFOYY=;
        b=FV2a/1SJIi+SGS4A5X/3eza1u6zVahLDLOki1a5MYgh3P0GAyUNoPhV4vd0aG6WopR
         JHPHYYcPt/i/1+6t4kqQJsRxARgx4DM+V3IZ9dL/o1/lHBoehYnTbGOgh04J9Cu9QB32
         eSG3YJkEx0FTwh/Ykp88eS+pWYfS/XQ8QxoCBqvpesfhZw67GCcO1rQvM6NoDV/Ja9nb
         KuMTv4HoF7oNwLlmUFoc99wp0Gg9enxwd4sc62oAL1wzB1wHjBlucVCT3Fk4slnLPa//
         KrANSN82hIB805sUzdGgofOmnlwS9adTWHQ3oVmCEitYP2IvaQmi1K7Yg3qhuGW6lGd2
         Y3SA==
X-Forwarded-Encrypted: i=1; AKwUvBzlTqEYiqc1eo4IMpbyOzxxnJ8d0TMDgCTZI1zc+rmwrhMgWCLc473Wwvon0iw9ju+pMyY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIm+v3rydN0ExcDFmfUIz48j75PbrIUUcuHlNorv4OHnPRHuNNW
	hYjWWk050WXtDKwmD60orWRq89r0b57GNQst2XLsWH5mS+Vx5uJzwtSI5uFDYfKekhakaJFOhWr
	Qli2S5NJTtyEoeRvBVVjBoFXiSzqq1jPHFBKhTEd8IcQ7ZpsRvTrcdQ/R5AdTxd87NUBbZYqABB
	QBUsOKoohm/muiq5ZLlV1/qp99lDJUrl3Z9qQ8CWCxEFCkUxs6ItaxXaDjyo25wD9pBiVFN2yVJ
	13WLGqm
X-Gm-Gg: AYBFou0XcmRRzVXUgVECL81Myx3SxQSse3FVooDghCy55DtLHSvWkjfeRO/A8yMeD/1
	zkMZtCakD+kVzDUO5QeQ5GSSLqI8Qw/hMiI8RUFv6lsgRefQ4Ru6fvM/tbKEbVOsr4N29c7EZxb
	9QT7LZdqaXebPLZe5wvIcJDjAUJgAdJ/KRI6gYMFABTvjVlmNN+2ONRIievMpLEEzZnMmCFrmbK
	T8pZudRpAY4SlB5q38qBFHso4jGZegR1Ch1OjTsSt17x565nTtWMXqBL1PjHpUUMMCNX5cvdyMQ
	dQ4VRgcmZenZnYWlCp26tlcUJk15Fyp9C6OvBXRkC7qrMfVYjIWrI4VJl6DHbrBEgDfcVkCzjmr
	9cwLPtdsT6mBYk5oRLDzthD6JWsw0P1TYtgKdOePJUdH3hMOSlfjlyXuHHBcYuyeXQWPPdnhBMy
	u4vA/Vo1cuIruSI3Z6oLmXUg22xdKjSroaodlpCTA=
X-Received: by 2002:a17:90b:5807:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ab3a9dfda0mr13999345a91.40.1792046556957;
        Wed, 14 Oct 2026 23:42:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac9404baf9sm1204596a91.0.2026.10.14.23.42.36
        for <mfd@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 23:42:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d36c1db7so9387377b3.0
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792046555; x=1792651355; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OC84CDQYOd+M3r9XSPMI2kjxix5Fp0PhVrunFyFOYY=;
        b=hhRuVzOLfwZ0JKWYSearj3rvds3H+bMGz+qVsBDn8DVH+P4f+uUV1Ccp4CrnL9YRge
         DPJ4UVG/1sbSx6p2TIVrwQ15XLMB3oh9MyCHM6Uz2zTY74THv50Fvs9rS3VCLkek8Yyn
         QQbrLQdth36gnXZ8Z53QG6txVAgswdhoxfaxA=
X-Forwarded-Encrypted: i=1; AKwUvBxE6AqHLA5i8T8rPvkeSkl8Pg7kkRH8L9wbzwC/YMftI++HVi3t9zcTpwRsEgBOfKuz57I=@lists.linux.dev
X-Received: by 2002:a05:690c:6e83:b0:8b0:ad62:198f with SMTP id 00721157ae682-8b0ad622e4dmr39101837b3.20.1792046555649;
        Wed, 14 Oct 2026 23:42:35 -0700 (PDT)
X-Received: by 2002:a05:690c:6e83:b0:8b0:ad62:198f with SMTP id
 00721157ae682-8b0ad622e4dmr39101727b3.20.1792046555226; Wed, 14 Oct 2026
 23:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 14 Oct 2026 23:42:23 -0700
X-Gm-Features: AclHuK8MqhIxV78OkDJc7RVD1tqBLyemGOTyu9kE9xQyiV2lmNBYtrDN89lNsJA
Message-ID: <CAHi4H7EE0_fafUh6Mnsi+R963F1n8zjiwCRV8fcP=P4K-zniVA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] BCMBCA PMB reset controller
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006397b2065ddb5acb"

--0000000000006397b2065ddb5acb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,


On Wed, Oct 14, 2026 at 2:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> This is another of these big upfront design binding and driver
> hoards that is the consequence of adding new SoC support. My stake
> is to be able to boot and test a full featured Cortex-A5 system and
> the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> Add a shared Processor Monitor Bus (PMB) driver and a child reset
> provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
> cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
> Platform Management Controller (PMC3) keyhole interface. It owns the
Power Management Controller

> register bank and serializes complete sequences for child services.
>
> The fixed SoC transport is built-in and has no sysfs bind/unbind
> controls, allowing delayed recovery to retain hardware ownership
> until a busy transaction completes. The reset child can be modular.
>
> The series contains three bindings, the PMB bus driver, and the PMB reset
> driver. Describe PMC 3.1 as a simple-mfd with two system-controller
> children and a bus child, each owning its register window.
>
> The bus child exposes the PMB transport and contains the reset provider.
> The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
> reset drivers support only the BCM6846-specific compatibles for now.
> Other BCMBCA SoCs have different reset groups or PMB interfaces.
>
> Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
> XRDP and its three Runner cores. The vendor sources describe individual
> PMB device addresses and reset masks, but no ID for this combined group.
> SoC tables map IDs to blocks, register values, timing and sequence
> callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
> analog-acquisition reset. Consumers must quiesce every affected user;
> these resets do not replace clock, power-domain, PHY or UBUS setup.
> Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
> left to power-domain and platform power-management support.
>
> This series is based on v7.3-rc1 and is a prerequisite for the
> forthcoming Genexis XG6846B Ethernet support series, which works.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series.
>
> MISSING:
>
> I did not add MAINTAINERS entries because I don't know how the Broadcom
> maintainers feel about it. Tell me.
>
I don't mind and please add yourself as the maintainer.

> MERGE STRATEGY:
>
> I'm not sure. Possibly through SoC with ACKs. Through an MFD immutable
> branch if Lee wants to handle it.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (5):
>       dt-bindings: mfd: Describe the BCM6846 PMC complex
>       dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
>       dt-bindings: reset: Describe the BCMBCA PMB reset controller
>       bus: Add a shared BCMBCA PMC3 PMB transport
>       reset: Add BCMBCA block resets through the PMB
>
>  .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  98 +++++++
>  .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  46 ++++
>  .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  51 ++++
>  drivers/bus/Kconfig                                |  13 +
>  drivers/bus/Makefile                               |   1 +
>  drivers/bus/bcmbca_pmc3_pmb.c                      | 232 +++++++++++++++=
++
>  drivers/reset/Kconfig                              |  15 ++
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-bcmbca-pmb.c                   | 281 +++++++++++++++=
++++++
>  include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  15 ++
>  include/linux/soc/bcm/bcmbca-pmb.h                 |  25 ++
>  11 files changed, 778 insertions(+)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

--0000000000006397b2065ddb5acb
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
8pEuM/k5MoAz7ZvztcfVveFS6UVVs8/awka8Jg6xYeYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDE1MDY0MjM1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAhP9kwuW2Id7dgA2fyie4z2uSTr7yBvOBSQgz
hjQuTwKLgYHnrjqjzNUGAlz38abhcOhsGC28JZ9V2qDzQfwRa7cLDBFOCWzSoB2PqfpsalRxkw7n
hmJMTpXaLliTpN+b7CzRpXL/QMwjNMcMvx/EG/K79Y2D3UHd0v7NqDbAtd3NrtMs/M9x0S/8YwB5
NEUO6gu37zIGEa5v9IKBiGl/Vgu9DSBitOdd+TK8wlQ6EFAoLnZtHg1Pprv/QKdUKDlnWnF4IzWo
0n9IfmoQ+pRq4nOCX5/I9hwZ8mjY8ZEhY9w+Kb8RerSp6RdLHjdl6BESNz0NSEXcYaw8rofsuO6h
ag==
--0000000000006397b2065ddb5acb--
