{$SCHEDULER->buildWeek()}

<table border=1>

<tr>
    <td rowspan="2"><a href="#" onClick="hpopup('{$UI_HANDLER}?act=SCHEDULER.set&week=--')"><<</a> </td>
    {foreach from=$SCHEDULER->Week item="_Weekday"}
        <td>{$_Weekday.label.full}</td>
    {/foreach}
    <td rowspan="2"><a href="#" onClick="hpopup('{$UI_HANDLER}?act=SCHEDULER.set&week=%2B%2B')">>></a></td>
</tr>

<tr>
{foreach from=$SCHEDULER->Week item="_Day"}
    <td valign="top">
        <a href="#" onClick="hpopup('{$UI_HANDLER}?act=SCHEDULER.set&view=day&day={$_Day.day}&month={$_Day.month}&year={$_Day.year}')"><b>{$_Day.day}</b></a>
        {if $_Day.isSelected}
            {assign var="_oneday" value=$SCHEDULER->getDayTiming($_Day.year, $_Day.month, $_Day.day)}
            <table border="1" style="font-family : monospace">
            {foreach from=$_oneday item="i"}
                <tr height="{$i.length/360}">
                    <td><small>
                        {if is_array($i.entry)}
                            Start:{$i.entry.start|regex_replace:"/[0-9]+T/":""}
                            <br>
                            End:&nbsp;&nbsp;{$i.entry.end|regex_replace:"/[0-9]+T/":""}
                        {else}
                            Gap
                        {/if}
                    </small></td>
                </tr>
            {/foreach}
            </table>
        {/if}
    </td>
{/foreach}
</tr>

</table>
